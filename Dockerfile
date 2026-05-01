FROM ghcr.io/alam00000/bentopdf:v1.16.1

USER root

COPY enc-custom.css /usr/share/nginx/html/enc-custom.css
COPY enc-brand.js /usr/share/nginx/html/enc-brand.js
COPY inject-enc.sh /docker-entrypoint.d/98-inject-enc.sh

RUN chmod +x /docker-entrypoint.d/98-inject-enc.sh
