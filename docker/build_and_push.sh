echo "Verify some cli commands"
pwd
aws -v
docker -v

echo "Setting up variables"
image="{{image name}}"
region="ap-southeast-2"

account=$(aws sts get-caller-identity --query Account --output text)

if [ $? -ne 0 ]
then
    echo "Failed to get aws account id"
    exit 255
fi

fullname="$account.dkr.ecr.$region.amazonaws.com/$image:latest"

echo "Describe repository $fullname"
aws ecr describe-repositories --repository-names "$image"

if [ $? -ne 0 ]
then
    echo "cannot describe repository $fullname .."
    exit 255
fi

echo "Authenticate Docker to ECR"
aws ecr get-login-password --region $region | docker login --username AWS --password-stdin $account.dkr.ecr.$region.amazonaws.com

echo "Start building docker .."
docker build -t $image .

echo "Push containers to ECR"
docker tag $image $fullname
docker push $fullname
