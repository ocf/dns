FROM docker.ocf.berkeley.edu/theocf/debian:jessie

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        bind9 \
        # Not needed for DNS server, but useful for debugging in container.
        dnsutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY etc /srv/dns/etc
RUN rm /etc/bind/named.conf.options /etc/bind/named.conf.local \
    && ln -s /srv/dns/etc/named.conf.options /etc/bind/named.conf.options \
    && ln -s /srv/dns/etc/named.conf.local /etc/bind/named.conf.local

USER bind
EXPOSE 10053
CMD ["/usr/sbin/named", "-g", "-p", "10053"]
