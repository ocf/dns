$ORIGIN ocf.io.
$TTL 1h
@ IN NS ns1.ocf.berkeley.edu.
@ IN NS ns2.ocf.berkeley.edu.

$INCLUDE ../db.ocf

; Sender Policy Framework (SPF) record
@ IN TXT "v=spf1 include:_spf.google.com ~all"

; Mail delivery
@ IN MX 1 aspmx.l.google.com.
@ IN MX 5 alt1.aspmx.l.google.com.
@ IN MX 5 alt2.aspmx.l.google.com.
@ IN MX 10 alt3.aspmx.l.google.com.
@ IN MX 10 alt4.aspmx.l.google.com.

; new status blog via github pages
dev-status IN CNAME ocf.github.io.

; DNSSEC support for Let's Encrypt records
letsencrypt	IN DS 57934 8 1 2201285F81BBD84AA166313B2835867708739376
letsencrypt	IN DS 57934 8 2 1C256F913B230E300CD1BC4F4F339A174DAFE21A6D770A9574037E35DD5AF766

; UptimeRobot
uptime IN CNAME stats.uptimerobot.com.

google._domainkey IN TXT ("v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuP8d6xhsw4gmDBkAe+QTCIF6GUrtthcPrP/mIeLxf9T0Y+0XAAAICVilcbQQBGkGdy7qEJQzOl8ZMqSpZXLhzuj4Exe3h5lfUbVIq5X1oUFIm/l7rC4110wv6AnDBejJ0qlgbmNsiXCtwuUe07T2A1y53u7CSMypIXsfXGhy6uk3YsqEphrZSRZ"
"3c8tJ/Ri+EujomknR9i0IN05dntZKW90/lJCthCDromLCbgrGYMu5eXUeTaCnXzxSuHEI8m5z516C6FqUxgloDDWu+LRTth+9xXGtjKOCIp/1M65XWl/jb/Lbu1+UeIc4OZg1hEhJxjjJZ4Fhe/gwdhxFd6PD/wIDAQAB")

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
