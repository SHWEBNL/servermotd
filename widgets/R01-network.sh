#!/usr/bin/env bash

#  network:
#    public ip;    215.105.10.10
#    private ip:   192.168.1.10

date=$(date +%Y%m%d)
tmp=/tmp/.motd.network
domain='myip.opendns.com @resolver1.opendns.com'

[[ -r "${tmp}" ]] && source "${tmp}"
if [[ "${lastupdate}" != "${date}" ]]; then
    privateip=$(ip route get 1.2.3.4 | awk '/^1.2.3.4/ {print $7}')
    publicip=$(dig +short ${domain})
    echo "lastupdate=${date}"     >  "${tmp}"
    echo "publicip=${publicip}"   >> "${tmp}"
    echo "privateip=${privateip}" >> "${tmp}"
fi

out=''
out+="public ip:|${publicip}\n"
out+="private ip:|${privateip}\n"

echo
echo 'network:'
echo -e "${out}" | column -ts'|' | sed 's,^,  ,'

