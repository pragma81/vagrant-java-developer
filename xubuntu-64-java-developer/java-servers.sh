#!/usr/bin/env bash

DEV_HOME=/home/vagrant/tools

if [ -f "$DEV_HOME/jboss-as-7.1.1.Final/bin/standalone.sh" ]
then
	echo "Jboss 7.1.1.Final already provisioned. It will not be installed."
    echo "------------------------"
else
    echo 'Install Jboss 7.1.1.Final'
    echo "------------------------"
    wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz -P /tmp
    tar xzf /tmp/jboss-as*.tar.gz -C /home/vagrant/tools/
    rm /tmp/jboss-as*.tar.gz
    sudo sed -i 's/#JAVA_HOME="/opt/java/jdk"/JAVA_HOME="/usr/lib/jvm/java-6-oracle"/g' /home/vagrant/tools/jboss-as-   7.1.1.Final/bin/standalone.conf
fi


if [ -f "$DEV_HOME/wildfly-10.0.0.Final/bin/standalone.sh" ]
then
	echo "Wildfly-10.0.0.Final already provisioned. It will not be installed."
    echo "------------------------"
else
    echo 'Install Wildfly 10'
    echo "------------------------"
    wget http://download.jboss.org/wildfly/10.0.0.Final/wildfly-10.0.0.Final.tar.gz -P /tmp
    tar xzf /tmp/wildfly*.tar.gz -C /home/vagrant/tools/
    rm /tmp/wildfly*.tar.gz
fi



