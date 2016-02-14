#!/usr/bin/env bash



echo 'Install JDK 8 in /usr/lib/jvm/java-8-oracle...'
echo "------------------------"
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
sudo echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
sudo apt-get install oracle-java8-set-default

echo 'Install Git and create local repository directory'
echo "------------------------"
sudo apt-get install git=1:1.9.1-1ubuntu0.2 -y

echo 'Install Git Flow...'
echo "------------------------"
wget -q – http://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh –no-check-certificate -P /tmp
sudo chmod a+x /tmp/gitflow-installer.sh
sudo sh /tmp/gitflow-installer.sh

echo 'Install Maven in /usr/share/maven...'
echo "------------------------"
sudo apt-cache search maven
sudo apt-get install maven=3.0.5-1 -y

#echo 'Install JDK 6 in /usr/lib/jvm/java-6-oracle...'
#sudo apt-get install -y oracle-java6-installer

echo 'Create Development directory...'
echo "------------------------"
mkdir /home/vagrant/Development
mkdir /home/vagrant/Development/git
sudo chmod 777 -R /home/vagrant/Development/
