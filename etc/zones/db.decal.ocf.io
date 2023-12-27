$ORIGIN decal.ocf.io.
$TTL 1h

@ IN SOA ns.ocf.berkeley.edu. hostmaster.ocf.berkeley.edu. (
        2023122701 ; serial number
        1d         ; slave refresh schedule interval
        30m        ; slave retry on failure interval
        4w         ; slave expiration of zone data
        30m        ; negative TTL
)

@ IN NS ns.ocf.berkeley.edu.

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
