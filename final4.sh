#!/bin/bash
wget https://rules.emergingthreats.net/blockrules/emerging-botcc.rules
wget https://rules.emergingthreats.net/blockrules/compromised-ips.txt
#Create the cisco ruleset
echo "hostname R1" > dropIPs.rules
echo "!" >> dropIPs.rules
echo "interface ethernet0" >> dropIPs.rules
echo "ip access-group 1 in" >> dropIPs.rules
echo "!" >> dropIPs.rules

#Makes the ips form the compromised-ips.txt file into an array
mapfile -t ips < compromised-ips.txt

#Adds all of the ips from the list to the rule set
for (( num=0;num < ${#ips[@]};num++ ))
do
        echo "access-list 1 deny host ${ips[$num]}" >> dropIPs.rules
        echo "access-list 1 permit any" >> dropIPs.rules
done
