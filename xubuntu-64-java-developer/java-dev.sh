#!/usr/bin/env bash

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y


echo 'Install JDK 6 in /usr/lib/jvm/java-6-oracle...'
echo "------------------------"
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java6-installer

echo 'Install JDK 8 in /usr/lib/jvm/java-8-oracle...'
echo "------------------------"
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

echo 'Set JDK 8 as default...'
sudo apt-get install oracle-java8-set-default

echo 'java -version:'
echo "------------------------"
java -version
echo "------------------------"


echo 'Install Maven in /usr/share/maven...'
echo "------------------------"
sudo apt-cache search maven
sudo apt-get install maven=3.0.5-1 -y

