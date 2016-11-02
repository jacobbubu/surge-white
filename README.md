# GFW Whitelist for Surge config

```
npm i
npm run build
```

will generate a `surge-config` file in following format:

```
[Rule]
DOMAIN-KEYWORD,facebook,Proxy,force-remote-dns
DOMAIN-KEYWORD,gmail,Proxy,force-remote-dns
DOMAIN-KEYWORD,google,Proxy,force-remote-dns
...

# Apple
DOMAIN-SUFFIX,mzstatic.com,DIRECT
DOMAIN-SUFFIX,icloud-content.com,DIRECT
...

DOMAIN-SUFFIX,cn,DIRECT
DOMAIN-SUFFIX,zoopda.com,DIRECT
DOMAIN-SUFFIX,yixun.com,DIRECT
DOMAIN-SUFFIX,jd.com,DIRECT
DOMAIN-SUFFIX,zdmimg.com,DIRECT
...

IP-CIDR,172.16.0.0/12,DIRECT
IP-CIDR,127.0.0.0/8,DIRECT

FINAL,Proxy
```

You could replace the `[RULE]` part of your surge config file. The original whitelist comes from https://github.com/n0wa11/gfw_whitelist/blob/master/whitelist.pac .