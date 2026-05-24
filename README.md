## If you make a change to LDAP, please *immediately* rebuild DNS and push to this repo.

# dns

DNS zones for the Open Computing Facility


## DNS source of truth

While this repo holds the live DNS config which is served by our DNS server,
the authoritative source for DNS is LDAP. Hosts can have the following LDAP
attributes:

* `dnsA` for A and AAAA records.

  Whether the host will automatically get IPv6 records depends on the type of
  host. For an up-to-date listing, run (in the dev shell):

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
is when one hostname needs multiple IPs.


## Making changes

When updating DNS, apply your changes to LDAP, and then run `nix develop` from koi.
It will rebuild the primary DNS (`db.ocf`) and reverse DNS, including pulling host data
from LDAP and bumping the serial number. It will automatically run named-checkzone on
all the zone files to identify any mistakes.

Sanity-check the diff before commiting to make sure the changes in LDAP make
sense. If not, don't push! Additionally, changes must be made through a PR, and GitHub
actions will run named-checkzones to verify the zone files before it can be merged.

The name server will be updated the next time puppet triggers on pestilence, which
should be at most 30 minutes after changes are merged.

Some zones under `etc/zones` are not automatically generated (e.g. `asuc.org`).
These have to be manually edited. Be sure to bump the serial.

## Hostname suggestions

A list of proposed hostnames, if you can't think of one, is located at
https://en.wikipedia.org/wiki/List_of_fish_by_common_name
