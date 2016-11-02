rules = require './rules'
EOL = require('os').EOL

surgeRules = rules.reduce (lines, rule) ->
    rule = rule[1..] if rule.startsWith '.'
    lines += "DOMAIN-SUFFIX,#{rule},DIRECT" + EOL
, ''

template = """
[Rule]
DOMAIN-KEYWORD,facebook,Proxy,force-remote-dns
DOMAIN-KEYWORD,gmail,Proxy,force-remote-dns
DOMAIN-KEYWORD,google,Proxy,force-remote-dns
DOMAIN-KEYWORD,instagram,Proxy,force-remote-dns
DOMAIN-KEYWORD,twitter,Proxy,force-remote-dns
DOMAIN-KEYWORD,youtube,Proxy,force-remote-dns
DOMAIN-SUFFIX,t.co,Proxy,force-remote-dns
DOMAIN-SUFFIX,twimg.com,Proxy,force-remote-dns
DOMAIN-KEYWORD,jackd,Proxy,force-remote-dns
DOMAIN-SUFFIX,scdn.co,Proxy,force-remote-dns
DOMAIN-SUFFIX,cdninstagram.com,Proxy,force-remote-dns
DOMAIN-SUFFIX,wikipedia.com,Proxy,force-remote-dns
DOMAIN-SUFFIX,wikipedia.org,Proxy,force-remote-dns

# Apple
DOMAIN-SUFFIX,mzstatic.com,DIRECT
DOMAIN-SUFFIX,icloud-content.com,DIRECT
DOMAIN-SUFFIX,cdn-apple.com,DIRECT
DOMAIN-SUFFIX,icloud.com,DIRECT

#{surgeRules}

IP-CIDR,91.108.56.0/22,Proxy,no-resolve
IP-CIDR,91.108.4.0/22,Proxy,no-resolve
IP-CIDR,109.239.140.0/24,Proxy,no-resolve
IP-CIDR,149.154.160.0/20,Proxy,no-resolve
IP-CIDR,10.0.0.0/8,DIRECT
IP-CIDR,172.16.0.0/12,DIRECT
IP-CIDR,127.0.0.0/8,DIRECT

FINAL,Proxy
"""

process.stdout.write template