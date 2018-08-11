$ORIGIN ocf.io.
$TTL 1h
@ IN NS ns1.ocf.berkeley.edu.
@ IN NS ns2.ocf.berkeley.edu.

$INCLUDE /srv/dns/etc/zones/db.ocf

; Sender Policy Framework (SPF) record
@ IN TXT "v=spf1 -all"

; DNSSEC support for Let's Encrypt records
letsencrypt	IN DS 57934 8 1 2201285F81BBD84AA166313B2835867708739376
letsencrypt	IN DS 57934 8 2 1C256F913B230E300CD1BC4F4F339A174DAFE21A6D770A9574037E35DD5AF766

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
