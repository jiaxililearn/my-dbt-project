FROM python:3.6.11

RUN echo 'Installing Libraries..'

RUN apt-get update && apt-get install -y apt-utils jq

COPY requirements.txt /opt/requirements.txt

RUN pip install -U pip
RUN pip install -r /opt/requirements.txt 
