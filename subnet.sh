#!/bin/bash
ip="${1%.*}"
for i in $(seq 1 254)
do
        dns="$(host ${ip}.${i})"
        dns="${dns#*pointer}"
        echo "${ip}.${i} - ${dns}
done
