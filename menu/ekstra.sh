#!/bin/bash
rm -f ekstra.sh*
cd
REPOSC="https://github.com/optimus-glitch/newsc/main"
wget -q "${REPOSC}/menu/menu.zip"
unzip menu.zip
chmod +x menu/*
mv menu/* /usr/local/sbin/
mv menu.zip /etc/alawivpn/menu.zip
rm -rf menu
wget -q -O /etc/xray/versisc "${REPOSC}/versi"
rm -f $0
