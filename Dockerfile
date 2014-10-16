FROM dockerfile/nginx

WORKDIR /

# Download latest stable version of Origins
RUN curl -OLs https://github.com/cbmi/origins-client/releases/download/untagged-067d64e/origins.tar.gz
RUN tar zxf /origins.tar.gz 2> /dev/null
RUN cp -r /origins/* /usr/share/nginx/html

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Add custom nginx config to accomodate SPA
ADD nginx.conf /etc/nginx.conf
ADD mime.types /etc/nginx/
ADD default /etc/nginx/sites-enabled/default

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx"]
