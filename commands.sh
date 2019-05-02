#!/bin/sh
telgu="$(id -u telegraf )"
log="$(tail -n 2 /var/log/auth.log | grep --line-buffered snoopy | grep -v $telgu)"
base="$(echo -ne $log |openssl base64)"
echo commands,tag=commands log="\"${base}\""
