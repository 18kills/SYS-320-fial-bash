#!/bin/bash
#this makes the ip address given be only the first 24 bits
ip="${1%.*}"
#This is a loop that loops through a /24 subnet
for i in $(seq 1 254)
do
        #The dns varibale is used to get the dns of the ip address
        dns="$(host ${ip}.${i})"
        dns="${dns#*pointer}"
        #ip variable is the first 24 bits of the ip
        #i variable is the last 8 bits of the ip address
        echo "${ip}.${i} - ${dns}
done
