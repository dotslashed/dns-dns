#!/bin/bash

#Sub-domain brute-forcer

echo "Enter domain name:::"

read DOMAIN

git clone https://github.com/blechschmidt/massdns.git

cd massdns

make

cd lists

rm names.txt resolvers.txt

wget "https://raw.githubusercontent.com/BonJarber/fresh-resolvers/main/resolvers.txt"

wget "https://github.com/danielmiessler/SecLists/raw/master/Discovery/DNS/dns-Jhaddix.txt" -O names.txt

cd ../

./scripts/subbrute.py lists/names.txt $DOMAIN | ./bin/massdns -r lists/resolvers.txt -t A -o S -w results.txt
