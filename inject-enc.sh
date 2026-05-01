#!/bin/sh

INDEX="/usr/share/nginx/html/index.html"

if [ -f "$INDEX" ]; then
  if ! grep -q "enc-custom.css" "$INDEX"; then
    sed -i 's|</head>|<link rel="stylesheet" href="/enc-custom.css"><script defer src="/enc-brand.js"></script></head>|' "$INDEX"
  fi
fi
