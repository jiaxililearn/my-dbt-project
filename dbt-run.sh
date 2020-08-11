#!/bin/bash

echo "setting up variables .."

DB_PASSWD='Cap76tain_'
DB_PASSWD_VAR='SNOWFLAKE_PASSWD'

image='dbt_container'

DBT_WORK_DIR="`pwd`/example"
DBT_PROFILE_DIR="$HOME/.dbt"

DOCKER_WORK_DIR='/opt/code'
DOCKER_PROFILE_DIR='/opt/profile'

DBT_RUN_CMD='dbt run'
DBT_TEST_CMD='dbt test'
DBT_RUN_ARGS="--profiles-dir $DOCKER_PROFILE_DIR \
--var '$DB_PASSWD_VAR: $DB_PASSWD'
"

echo "getting dbt docker container .."


echo "checking dbt version .."
# docker run --rm $image dbt --version

echo "running dbt run .."
docker run --rm -v $DBT_WORK_DIR:$DOCKER_WORK_DIR \
                -v $DBT_PROFILE_DIR:$DOCKER_PROFILE_DIR \
                $image \
                bash -c "cd $DOCKER_WORK_DIR; $DBT_RUN_CMD $DBT_RUN_ARGS"

echo "running dbt test .."
docker run --rm -v $DBT_WORK_DIR:$DOCKER_WORK_DIR \
                -v $DBT_PROFILE_DIR:$DOCKER_PROFILE_DIR \
                $image \
                bash -c "cd $DOCKER_WORK_DIR; $DBT_TEST_CMD $DBT_RUN_ARGS"
