FROM ubuntu:rolling as builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y npm nodejs hugo git

RUN mkdir -p /workdir/

COPY . /workdir/

WORKDIR /workdir/
RUN npm install

ENV NODE_ENV="production hugo"

RUN hugo

FROM nginx:latest

COPY --from=builder /workdir/public /usr/share/nginx/html
