#!/bin/sh

INDEX="/usr/share/nginx/html/index.html"

echo "ENC: aplicando tema..."

if [ -f "$INDEX" ]; then
  sed -i '/enc-custom.css/d' "$INDEX"
  sed -i '/enc-brand.js/d' "$INDEX"
  sed -i 's|</head>|<link rel="stylesheet" href="/enc-custom.css?v=enc3"><link rel="icon" href="/favicon.svg"><script defer src="/enc-brand.js?v=enc3"></script></head>|' "$INDEX"
  echo "ENC: tema aplicado."
else
  echo "ENC: index.html não encontrado."
fi
