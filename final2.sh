#!/bin/bash

#Create the arrays the info is going to be in
txt=()
ip=()
date=()
method=()
uri=()
userAgent=()

#Fills the txt array with the info that is in the txt file
mapfile -t txt < access.log.txt

#Create the csv file
echo "IP, Date, Method, URI, User Agent" > accessLog.csv

#moving the info in the txt file to there arrays
#ip addresses in the txt file moved to ip array
#dates in txt array move to date array
for (( num=0;num < ${#txt[@]};num++ ))
do
        content=${txt[$num]}
        #Gets all the ips and puts them in the ip array
        getIndex=" "
        indexOf=${content%%$getIndex*}
        ip[$num]=${content:0:${#indexOf}}
        #cut the ip out of the content variable
        getIndex="["
        indexOf=${content%%$getIndex*}
        content=${content:${#indexOf}+1}
        #Get the date and put it in the date array
        getIndex=" "
        indexOf=${content%%$getIndex*}
        date[$num]=${content:0:${#indexOf}}
        #Cut the date out of the content
        getIndex='"'
        indexOf=${content%%$getIndex*}
        content=${content:${#indexOf}+1}
        #Get the method and put it in the method array
        getIndex=" "
        indexOf=${content%%$getIndex*}
        method[$num]=${content:0:${#indexOf}}
        #Cut the method out of the content
        getIndex="/"
        indexOf=${content%%$getIndex*}
        content=${content:${#indexOf}}
        #Get the URI and put it in the uri array
        getIndex=" "
        indexOf=${content%%$getIndex*}
        uri[$num]=${content:0:${#indexOf}}
        #Cut the URI out of the content
        getIndex='-" "'
        indexOf=${content%%$getIndex*}
        content=${content:${#indexOf}+4}
        #Get the user Agent and put it in the userAgent array
        getIndex='"'
        indexOf=${content%%$getIndex*}
        userAgent[$num]=${content:0:${#indexOf}}
        #Add the info to the csv file
        echo "${ip[$num]}, ${date[$num]}, ${method[$num]}, ${uri[$num]}, ${userAgent[$num]}" >> accessLog.csv
done
