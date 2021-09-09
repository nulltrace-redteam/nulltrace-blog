FROM mishrasunny174/hugo-builder as builder

RUN apt-get update && apt-get install -y npm nodejs

RUN mkdir -p /workdir/config
RUN mkdir -p /workdir/content
RUN mkdir -p /workdir/themes
RUN mkdir -p /workdir/static

COPY config /workdir/config
COPY content /workdir/content
COPY themes /workdir/themes
COPY static /workdir/static

RUN cd /workdir/themes/nulltrace && npm i
WORKDIR /workdir/

ENV NODE_ENV="production hugo"

RUN ~/go/bin/hugo

FROM nginx:latest

COPY --from=builder /workdir/public /usr/share/nginx/html
RUN chmod 755 -R /usr/share/nginx/html
