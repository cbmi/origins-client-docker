FROM dockerfile/nginx

WORKDIR /

# Download latest stable version of Origins
RUN curl -OLs https://github.com/cbmi/origins-client/releases/download/0.1.0-beta5/origins.tar.gz
RUN tar zxf /origins.tar.gz 2> /dev/null
RUN cp -r /origins/* /usr/share/nginx/html

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

# Add custom nginx config to accomodate SPA
ADD nginx.conf /etc/nginx/
ADD mime.types /etc/nginx/
ADD default /etc/nginx/sites-enabled/default
RUN mkdir -p /usr/share/nginx/logs

ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx"]
