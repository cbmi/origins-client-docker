#!/bin/bash

# Backup the index.html file which contains the default settings
if [ -f /usr/share/nginx/html/.index.html ]; then
    cp /usr/share/nginx/html/.index.html /usr/share/nginx/html/index.html
else
    cp /usr/share/nginx/html/index.html /usr/share/nginx/html/.index.html
fi

# Replace configuration host with environment variable if defined
if [ -n "${ORIGINS_ENDPOINT-}" ]; then
    sed -i "s|http://localhost:5000|$ORIGINS_ENDPOINT|g" /usr/share/nginx/html/index.html
fi

$@
