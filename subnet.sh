#!/bin/bash
ip="${1%.*}"
dns=$(host )
for i in $(seq 1 254)
do
        dns="$(host $ip)"
        dns="${dns#*pointer}"
        echo "${ip}.${i} - ${dns}
done
