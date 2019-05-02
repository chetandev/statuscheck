#!/bin/sh
telgu="$(id -u telegraf )"
log="$(tail -n 10 /var/log/auth.log | grep --line-buffered snoopy | grep -v $telgu)"
base="$(echo  $log |openssl base64)"
echo commands,tag=commands log="\"${base}\""
