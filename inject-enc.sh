#!/bin/sh

INDEX="/usr/share/nginx/html/index.html"

echo "Aplicando personalização ENC..."

if [ -f "$INDEX" ]; then
  sed -i '/enc-custom.css/d' "$INDEX"
  sed -i '/enc-brand.js/d' "$INDEX"

  sed -i 's|</head>|<link rel="stylesheet" href="/enc-custom.css?v=enc20260501"><script defer src="/enc-brand.js?v=enc20260501"></script></head>|' "$INDEX"

  echo "Personalização ENC aplicada com sucesso."
else
  echo "index.html não encontrado."
fi
