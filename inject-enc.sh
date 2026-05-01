#!/bin/sh

echo "ENC: procurando arquivos HTML..."

find /usr/share/nginx/html -name "*.html" -type f | while read FILE; do
  echo "ENC: aplicando tema em $FILE"

  sed -i '/enc-custom.css/d' "$FILE"
  sed -i '/enc-brand.js/d' "$FILE"

  sed -i 's|</head>|<link rel="stylesheet" href="/enc-custom.css?v=enc10"><script defer src="/enc-brand.js?v=enc10"></script></head>|' "$FILE"

  grep -q "enc-custom.css" "$FILE" && echo "ENC: OK em $FILE" || echo "ENC: FALHOU em $FILE"
done
