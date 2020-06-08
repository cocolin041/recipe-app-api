FROM python:3.7-alpine
MAINTAINER Coco

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
# switch to this /app
WORKDIR /app
COPY ./app /app

# for security purpose, if not, it will run with root
RUN adduser -D user
USER user