#!/bin/bash

rm -rf output && rm -rf collage_assets
mkdir collage_assets
rm -rf collage.png

X=0

while [ "$X" -lt 4 ] 
do 
  ./bin/googliser -n 2 -o output -p "`fortune | cut -c1-200`" -u 250000 -l 10000 -f 0 -S
  rm -rf output/googliser*
  for file in `ls output`; do
    echo "$X-$file"
    mv output/$file "collage_assets/$X-$file"
  done
  let "X = X + 1"
done

python collage_maker.py -f collage_assets -o collage.png -w 1000 -i 250 -s

exit 0
