#!/usr/bin/env bash

#Constants

DEV_HOME=/home/vagrant/Development
ECLIPSE_HOME=$DEV_HOME/eclipse
ECLIPSE_SETTINGS=/vagrant/settings/eclipse

if [ -f "$ECLIPSE_HOME/eclipse" ]
then
	echo "Eclipse already provisioned. It will not be installed."
    echo "------------------------"
else
	
    echo 'Install Eclipse JEE MARS...'
    echo "------------------------"
    wget http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/kepler/SR2/eclipse-jee-kepler-SR2-linux-gtk-       x86_64.tar.gz -P /tmp

    wget http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/mars/1/eclipse-jee-mars-1-linux-gtk-x86_64.tar.gz -P /tmp

    tar xzf /tmp/eclipse-jee-*-linux-gtk*.tar.gz -C $DEV_HOME
    sudo ln -s $ECLIPSE_HOME/eclipse /usr/bin/eclipse
    sudo mv /tmp/eclipse.desktop /usr/share/applications/
    rm /tmp/eclipse-jee-*-linux-gtk*.tar.gz
fi

echo 'Install Eclipse Plugins...'
echo "------------------------"
$ECLIPSE_HOME/eclipse -consolelog -nosplash -data /tmp \
      -application org.eclipse.ant.core.antRunner \
      -f $ECLIPSE_SETTINGS/director.xml \
      -DtargetDir=$ECLIPSE_HOME \
      -DsourceSites=http://download.eclipse.org/technology/m2e/releases,http://subclipse.tigris.org/update_1.10.x,http://download.eclipse.org/mylyn/release/mars \
      -Dinstall=org.eclipse.m2e.logback.feature.feature.group,org.tigris.subversion.subclipse.feature.group,org.tigris.subversion.subclipse.mylyn.feature.group,org.tigris.subversion.clientadapter.feature.feature.group,org.tigris.subversion.clientadapter.javahl.feature.feature.group,org.tigris.subversion.subclipse.graph.feature.feature.group,org.tigris.subversion.clientadapter.svnkit.feature.feature.group,com.collabnet.subversion.merge.feature.feature.group
       
      
#echo 'Install Tomcat 7.0.39...'
#echo "------------------------"
#wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.39/bin/apache-tomcat-7.0.39.tar.gz -P /tmp
#tar xzf /tmp/apache-tomcat*.tar.gz -C /home/vagrant/Development/
#rm /tmp/apache-tomcat*.tar.gz




#echo 'Install Chrome...'
#echo "------------------------"
#wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
#sudo dpkg -i /tmp/google-chrome*; sudo apt-get -f install -y
#rm /tmp/google*chrome*.deb
