FROM python:3.6.11

RUN echo 'Installing DBT Libraries..'

COPY requirements.txt /opt/requirements.txt

RUN pip install -U pip
RUN pip install -r /opt/requirements.txt
