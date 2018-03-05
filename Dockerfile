FROM alpine:edge
RUN apk --no-cache add dnsmasq python3 && \
  easy_install-3.6 pip && \
  pip install --upgrade pip && \
  pip install requests
EXPOSE 53/udp

ADD dnsmasq.conf /etc/dnsmasq.conf

WORKDIR /admasq
ADD admasq /admasq

RUN mkdir /data
ADD sources /data
ADD whitelist /data
RUN /admasq/admasq --ip 127.0.0.1 --input /data/sources --output /data/admasq.conf --whitelist /data/whitelist
VOLUME /data

ENTRYPOINT ["dnsmasq", "-k", "--log-facility=-"]
