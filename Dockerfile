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
COPY ./package.json ./package-lock.json /workdir/

WORKDIR /workdir/
RUN npm install
RUN npm install -g \
postcss-cli \
autoprefixer \
postcss-import \
@fullhuman/postcss-purgecss \
@tailwindcss/typography \
postcss \
tailwindcss \
purgecss

ENV NODE_ENV="production hugo"

RUN ~/go/bin/hugo

FROM nginx:latest

COPY --from=builder /workdir/public /usr/share/nginx/html
