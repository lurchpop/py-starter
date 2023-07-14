# build from ../ context
FROM python:3.10.12-alpine3.18

RUN pip install --upgrade pip
COPY app/requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt