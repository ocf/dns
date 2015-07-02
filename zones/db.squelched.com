$ORIGIN squelched.com.
$TTL 5m

@ IN SOA ns1.ocf.berkeley.edu. hostmaster.ocf.berkeley.edu. (
2015070100 ; serial number
                         1d         ; slave refresh schedule interval
                         30m        ; slave retry on failure interval
                         4w         ; slave expiration of zone data
                         30m        ; negative TTL
                       )

@ IN NS ns1.ocf.berkeley.edu.
@ IN NS ns2.ocf.berkeley.edu.

@ IN MX 5 sandstorm.OCF.Berkeley.EDU.

@ IN TXT "v=spf1 a:anthrax.ocf.berkeley.edu a:sandstorm.ocf.berkeley.edu ~all"

@	IN A	169.229.10.23
www	IN CNAME	@
