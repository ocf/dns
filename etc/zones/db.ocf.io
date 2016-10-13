$ORIGIN ocf.io.
$TTL 1h
@ IN NS ns1.ocf.berkeley.edu.
@ IN NS ns2.ocf.berkeley.edu.

$INCLUDE /srv/dns/etc/zones/db.ocf

; Sender Policy Framework (SPF) record
@ IN TXT "v=spf1 -all"

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
