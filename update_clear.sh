#!/bin/bash

sudo apt update && sudo apt upgrade -y

echo "===================================="
echo "apt update & upgrade successfull"
echo "===================================="

sudo apt clean && sudo apt autoclean && sudo apt autoremove -y && sudo journalctl --vacuum-size=100M && rm -rf ~/.cache/* && sudo rm -rf /tmp/*

echo "===================================="
echo "Cache cleared successfull"
echo "===================================="