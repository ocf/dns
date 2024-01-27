$ORIGIN decal.ocfhosted.com.
$TTL 1h

@ IN SOA ns.ocf.berkeley.edu. hostmaster.ocf.berkeley.edu. (
        2023122900 ; serial number
        1d         ; slave refresh schedule interval
        30m        ; slave retry on failure interval
        4w         ; slave expiration of zone data
        30m        ; negative TTL
)

@ IN NS ns.ocf.berkeley.edu.

@ IN A    169.229.226.23
@ IN AAAA 2607:f140:8801::1:23

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
