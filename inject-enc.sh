#!/bin/sh
set -eu

# BentoPDF normalmente fica em /usr/share/nginx/html, mas deixei o script robusto.
WEBROOT=""
for DIR in /usr/share/nginx/html /app /public /var/www/html; do
  if [ -f "$DIR/index.html" ]; then
    WEBROOT="$DIR"
    break
  fi
done

if [ -z "$WEBROOT" ]; then
  WEBROOT=$(find / -name index.html -type f 2>/dev/null | head -n 1 | xargs dirname || true)
fi

if [ -z "$WEBROOT" ] || [ ! -f "$WEBROOT/index.html" ]; then
  echo "ENC: index.html não encontrado. A imagem base pode ter mudado."
  exit 0
fi

cp /tmp/enc-custom.css "$WEBROOT/enc-custom.css"
cp /tmp/enc-brand.js "$WEBROOT/enc-brand.js"
cp /tmp/enc-logo.svg "$WEBROOT/enc-logo.svg"
cp /tmp/favicon.svg "$WEBROOT/favicon.svg"

INDEX="$WEBROOT/index.html"

# Evita injeção duplicada em rebuilds.
if ! grep -q 'enc-custom.css' "$INDEX"; then
  sed -i 's|</head>|<link rel="stylesheet" href="/enc-custom.css"><link rel="icon" type="image/svg+xml" href="/favicon.svg"><script defer src="/enc-brand.js"></script></head>|' "$INDEX"
fi

echo "ENC: personalização aplicada em $WEBROOT"
