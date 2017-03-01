# dns

[![Build Status](https://jenkins.ocf.berkeley.edu/buildStatus/icon?job=dns/master)](https://jenkins.ocf.berkeley.edu/job/dns/job/master/)

DNS zones for the Open Computing Facility

When updating dns, run `make`. It will run build rules for updating DNS zone
serial number, and updates to reverse-dns, ldap, and other systems.


The Makefile supports environment setup with `make venv` and `make install-hooks`.


Make supports:
- all
- build
- venv
- test
- install-hooks
