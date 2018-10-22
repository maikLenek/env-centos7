#!/bin/sh

echo "#############################"
echo "#      Python 3.6 install     #"
echo "#############################"
sudo yum -y install python36u
sudo yum -y install python36u-pip
sudo yum -y install python36u-devel
sudo pip3.6 install --upgrade pip