#!/usr/bin/env sh

mkdir -p tmp
touch tmp/ua.txt

curl 'https://user-agents.net/download' -X POST --data-raw 'download=txt&browser_bits=64&brower_type=browser&limit=100' >> tmp/ua.txt
cat tmp/ua.txt | sort -R | head -1
