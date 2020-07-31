# dns

[![Build Status](https://jenkins.ocf.berkeley.edu/buildStatus/icon?job=ocf/dns/master)](https://jenkins.ocf.berkeley.edu/job/ocf/job/dnsjob/master/)

DNS zones for the Open Computing Facility


## DNS source of truth

While this repo holds the live DNS config which is served by our DNS server,
the authoritative source for DNS is LDAP. Hosts can have the following LDAP
attributes:

* `dnsA` for A and AAAA records.

  Whether the host will automatically get IPv6 records depends on the type of
  host. For an up-to-date listing, run:

  ```bash
  $ python3 -c 'import ocflib.infra.hosts; print(ocflib.infra.hosts.HOST_TYPES_WITH_IPV6)'
  ```

* `dnsCname` for CNAME records.


In most cases, you should not use `dnsA`. For example, the mail server has:

```bash
$ ldapsearch -x cn=anthrax dnsCname
# anthrax, Hosts, OCF.Berkeley.EDU
dn: cn=anthrax,ou=Hosts,dc=OCF,dc=Berkeley,dc=EDU
dnsCname: mail
dnsCname: smtp
```

There are some rare cases where it's necessary to use A records instead,
usually mandated by some RFC. For example, the "apex" (root) of a domain cannot
be a CNAME (because of the SOA record), so you must use dnsA. Another example
is when one hostname needs multiple IPs (e.g. `mesos.ocf.berkeley.edu`).


## Making changes

When updating DNS, apply your changes to LDAP, and then run `make`. It will
rebuild the primary DNS (`db.ocf`) and reverse DNS, including pulling host data
from LDAP and bumping the serial number.

Sanity-check the diff before commiting to make sure the changes in LDAP make
sense. If not, don't push!

Some zones under `etc/zones` are not automatically generated (e.g. `asuc.org`).
These have to be manually edited. Be sure to bump the serial.

The Makefile targets you're intended to run are:

- `make`: update the DNS
- `make test`: run pre-commit hooks
- `make install-hooks`: install pre-commit hooks so that they run automatically


## Hostname suggestions

A list of proposed hostnames, if you can't think of one, is located at
`~staff/server_name_ideas`.
