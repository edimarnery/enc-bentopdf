FROM ghcr.io/alam00000/bentopdf:v1.16.1

USER root

COPY enc-custom.css /tmp/enc-custom.css
COPY enc-brand.js /tmp/enc-brand.js
COPY enc-logo.svg /tmp/enc-logo.svg
COPY favicon.svg /tmp/favicon.svg
COPY inject-enc.sh /tmp/inject-enc.sh

RUN chmod +x /tmp/inject-enc.sh && /tmp/inject-enc.sh

USER nginx
