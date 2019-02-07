#!/bin/bash

cd /var/www/html/sites/avatarable/avatarable

rm -rf avatar.png

./bin/govatar generate male -o avatar.png

./getittogether.sh

TXT="`fortune | cut -c1-110`"
echo "$TXT... Randomly generated every hour." > saying.txt

python upload.py

exit 0
