#!/bin/sh

# Install system packages
echo "################################"
echo "## Update && install packages ##"
echo "################################"
sudo yum -y update
sudo yum -y install yum-utils
sudo yum -y install groupinstall development
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm

sudo yum -y install htop
sudo yum -y install mc