#!/bin/bash
ip="${1%.*}"
echo $ip
for i in $(seq 1 254)
do
        echo "${ip}.${i}"
done
