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

google._domainkey IN TXT ("v=DKIM1;k=rsa;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAodgotNRIHYKQOfT5A7+HsmGyAKz4hCPk9qedctevKq3XLsmJqYMufUE3kdUOoVDAjKlt/4xwLGh+FvcyTCdX/0VtVzqWyta5uaHELxXvjUqWlKAK5CeHsOZCZiCbispRn6yPwyEPWizHVmPF0OyN1qj4QIZvG6E0lk98sE318eRhXFoiPEM6W"
"fkeUv8TECY76xyfP9htizrPXSdw/Fye043xCJg/2STpWb1knUucNsVRNDj5Gz0ZdjBsLUh2j9PUx/ufeUWmZ8/Us1k+OHkV5BUxISlHxcFwhN5LzoPO/6WLeLRpj1UHMdSBVa/rhmw28vsu7JYRJwfgGmsm+beisQIDAQAB")

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
