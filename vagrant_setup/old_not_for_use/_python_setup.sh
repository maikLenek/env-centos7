#!/usr/bin/env bash

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

printf "#################################\n"
printf "##### Installing virtualenv #####\n"
printf "#################################\n\n"
sudo pip install --upgrade pip
sudo pip install virtualenv

cd /sry/bettingatsage/
virtualenv .venv -p python3 --always-copy
printf "#################################\n"
printf "#####  End of Installation  #####\n"
printf "#################################\n\n"
