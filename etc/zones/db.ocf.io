$ORIGIN ocf.io.
$TTL 1h
@ IN NS ns1.ocf.berkeley.edu.
@ IN NS ns2.ocf.berkeley.edu.

$INCLUDE ../db.ocf

; Sender Policy Framework (SPF) record
@ IN TXT "v=spf1 -all"

; new status blog via github pages
dev-status IN CNAME ocf.github.io.

; DNSSEC support for Let's Encrypt records
letsencrypt	IN DS 57934 8 1 2201285F81BBD84AA166313B2835867708739376
letsencrypt	IN DS 57934 8 2 1C256F913B230E300CD1BC4F4F339A174DAFE21A6D770A9574037E35DD5AF766

; UptimeRobot
uptime IN CNAME stats.uptimerobot.com.

; Kubernetes Control Plane Cluster 0
k8s0 IN A 169.229.226.8

; vim: noet ts=16 sts=16 sw=16 ft=bindzone
