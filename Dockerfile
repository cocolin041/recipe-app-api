FROM python:3.7-alpine
MAINTAINER Coco

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
      gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
# switch to this /app
WORKDIR /app
COPY ./app /app

# for security purpose, if not, it will run with root
RUN adduser -D user
USER user