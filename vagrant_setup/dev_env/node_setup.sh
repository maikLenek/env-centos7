#!/bin/sh

echo "################"
echo "    Node JS     "
echo "################"
sudo yum -y install curl
sudo yum -y install epel-release
curl -sL https://rpm.nodesource.com/setup_8.x | bash -
sudo yum -y install nodejs