FROM node:13.4.0-alpine3.10

WORKDIR /usr/src/app

RUN apk update && \
    npm install -g npm @vue/cli
