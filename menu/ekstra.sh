#!/bin/bash
rm -f ekstra.sh*
cd
REPOSC="https://raw.githubusercontent.com/optimus-glitch/newsc/main"
wget -q "${REPOSC}/menu/menu.zip"
unzip -P C@rl7641 menu.zip
chmod +x menu/*
mv menu/* /usr/local/sbin/
mv menu.zip /etc/alawivpn/menu.zip
rm -rf menu
wget -q -O /etc/xray/versisc "${REPOSC}/versi"
rm -f $0
