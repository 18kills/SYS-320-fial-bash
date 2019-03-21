#!/bin/bash
ip="${1%.*}"
dns=$(host )
for i in $(seq 1 254)
do
        echo "${ip}.${i}"
done
