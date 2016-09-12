$ORIGIN squelched.com.
$TTL 5m

@ IN SOA ns1.ocf.berkeley.edu. hostmaster.ocf.berkeley.edu. (
2016091100 ; serial number
                         1d         ; slave refresh schedule interval
                         30m        ; slave retry on failure interval
                         4w         ; slave expiration of zone data
                         30m        ; negative TTL
                       )

@ IN NS ns1.ocf.berkeley.edu.
@ IN NS ns2.ocf.berkeley.edu.

@ IN MX 5 sandstorm.OCF.Berkeley.EDU.

@ IN TXT "v=spf1 a:anthrax.ocf.berkeley.edu a:sandstorm.ocf.berkeley.edu ~all"

@	IN A	169.229.226.23
@	IN AAAA	2607:f140:8801::1:23
www	IN CNAME	@

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
