# admasq

Domain adblocking with dnsmasq.

## Setup

On a server with systemd-networkd and systemd-resolved configured, install the
PKGBUILD. There will be two DNS servers running on the same machine:

  * systemd-resolved, listening on 127.0.0.53, relaying to DNS server configured
    for network device.
  * dnsmasq, listening on 0.0.0.0, blocking certain domains and relaying to
    DNS server configured for network device.

Making dnsmasq directly use the upstream DNS server ensures that:

  * dnsmasq will not resolve the server's hostname with 127.0.0.1.
  * DNS requests from the server will not use adblocking. If adblocking
    for the server's requests is desired, disable systemd-resolved
    and setup `/etc/resolv.conf` to use dnsmasq.

To make dnsmasq use the admasq block list, add the following lines to
`/etc/dnsmasq.conf`:

    resolve-file=/run/systemd/resolve/resolv.conf
    no-hosts
    conf-file=/var/lib/admasq/admasq.conf

Then, enable the admasq timer (redirecting to ip 127.0.0.1) and run the service
once:

    systemctl enable admasq@127.0.0.1.timer
    systemctl start admasq@127.0.0.1.service

Start/restart dnsmasq:

    systemctl restart dnsmasq

Then setup your other clients to use the new DNS server by manual configuration
and/or pushing the new DNS server by DHCP.
