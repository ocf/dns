$ORIGIN ocfhosted.com.
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
@ IN MX   5 anthrax.ocf.berkeley.edu.
@ IN TXT  "v=spf1 include:_spf.ocf.berkeley.edu -all"

decal IN DS 60914 8 2 C423DDAFD52D15168FC96EB719BA6FA65835801EF2804AFBCF041B5876D31B70

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
