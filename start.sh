#!/bin/bash

# Replace configuration host with environment variable if defined
if [ -n "${ORIGINS_ENDPOINT-}" ]; then
    sed -i "s|http://localhost:5000|$ORIGINS_ENDPOINT|g" /usr/share/nginx/html/index.html
fi

nginx
