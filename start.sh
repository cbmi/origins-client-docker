#!/bin/bash

# Replace configuration host with environment variable if defined
if [ -n "${ORIGINS_HOST-}" ]; then
    sed -i "s|http://localhost:5000|$ORIGINS_HOST|g" /usr/share/nginx/html/index.html
fi

nginx
