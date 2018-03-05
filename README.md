# admasq

Domain adblocking with dnsmasq.

## Setup

On a server with docker, run the daoo/admasq image as follows:

    # docker run --publish $HOST_IP:53:53/udp \
        --cap-add=NET_ADMIN \
        --dns=$DNS_IP \
        --dns-search=$DNS_DOMAIN \
        --restart=always \
        --name=admasq \
        --detach \
        daoo/admasq:latest

Specifying the IP to listen on and the upstream DNS server explicitly avoids
any conflicts with `systemd-resolved`.

Optionally, for automatic updates, enable the [admasq.timer](admasq.timer) and
[admasq.service](admasq.service) files in systemd.

Then setup your other clients to use the new DNS server by manual configuration
and/or pushing the new DNS server by DHCP.
