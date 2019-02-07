#!/bin/bash

# GET READY FOR BINARY
mkdir bin

pip install -r requirements.txt

# Install Our Phrase Generator
dnf install fortune

# Install Our Avatar Generator
wget https://github.com/o1egl/govatar/releases/download/0.2.0/govatar-linux-amd64.0.2.0.zip
unzip -x govatar-linux-amd64.0.2.0.zip
mv build/govatar bin/govatar
rm -rf build govatar-linux-amd64.0.2.0.zip

# Install our Image Grabber
wget -qN git.io/googliser.sh && chmod +x googliser.sh
mv googliser.sh bin/googliser

# Install Collage Maker
wget https://github.com/delimitry/collage_maker/archive/master.zip
unzip -x master.zip && rm -rf master.zip && \
    mv collage_maker-master/collage_maker.py . && \
    chmod 775 collage_maker.py && rm -rf collage_maker-master 

# Install Web Gobble ??
# wget https://sebsauvage.net/python/webgobbler/wg126src.zip

exit 0
