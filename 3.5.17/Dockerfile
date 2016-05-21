FROM alpine:3.3
MAINTAINER Stephen Bunn "scbunn@sbunn.org"

COPY docker-entrypoint.sh /
RUN apk update &&\
    apk add --no-cache su-exec &&\
    apk add --no-cache squid && \
    chmod +x /docker-entrypoint.sh
COPY conf/squid.conf /etc/squid/squid.conf
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
