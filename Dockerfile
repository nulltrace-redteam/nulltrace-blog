FROM ubuntu:rolling as builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y npm nodejs hugo

RUN mkdir -p /workdir/config
RUN mkdir -p /workdir/content
RUN mkdir -p /workdir/themes
RUN mkdir -p /workdir/static

COPY config /workdir/config
COPY content /workdir/content
COPY themes /workdir/themes
COPY static /workdir/static
COPY ./package.json ./package-lock.json /workdir/

WORKDIR /workdir/
RUN npm install

ENV NODE_ENV="production hugo"

RUN hugo

FROM nginx:latest

COPY --from=builder /workdir/public /usr/share/nginx/html
