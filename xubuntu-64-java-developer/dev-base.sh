#!/usr/bin/env bash

echo 'Install Git'
echo "------------------------"
sudo apt-get install git=1:1.9.1-1ubuntu0.2 -y

echo 'Install Git Flow...'
echo "------------------------"
wget -q – http://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh –no-check-certificate -P /tmp
sudo chmod a+x /tmp/gitflow-installer.sh
sudo sh /tmp/gitflow-installer.sh

echo 'Create Development directory...'
echo "------------------------"
mkdir /home/vagrant
#developer tools installation directory.
mkdir /home/vagrant/tools

#developer tools git base directory
mkdir /home/vagrant/git

sudo chmod 777 -R /home/vagrant/tools
