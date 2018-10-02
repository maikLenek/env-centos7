#!/bin/sh

# Install system packages
echo "#############################"
echo "##  Update system packages ##"
echo "#############################"
sudo yum -y update
sudo yum -y install yum-utils
sudo yum -y install groupinstall development
sudo yum -y install https://centos7.iuscommunity.org/ius-release.rpm


echo "#############################"
echo "#      Python 3 install     #"
echo "#############################"
sudo yum -y install python36u
sudo yum -y install python36u-pip
sudo yum -y install python36u-devel
sudo pip3.6 install --upgrade pip

echo "################"
echo " PostgreSQL 9.6 "
echo "################"
sudo yum -y install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm
sudo yum -y install postgresql96
sudo yum -y install postgresql96-server
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl enable postgresql-9.6
sudo systemctl start postgresql-9.6

echo "################"
echo "    Node JS     "
echo "################"
sudo yum -y install curl
sudo yum -y install epel-release
curl -sL https://rpm.nodesource.com/setup_8.x | bash -
sudo yum -y install nodejs




