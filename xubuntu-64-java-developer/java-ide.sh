#!/usr/bin/env bash

DEV_DESKTOP=/home/vagrant/Desktop
TOOLS_HOME=/home/vagrant/tools
ECLIPSE_HOME=$TOOLS_HOME/eclipse
ECLIPSE_SETTINGS=/vagrant/settings/eclipse

if [ -f "$ECLIPSE_HOME/eclipse" ]
then
	echo "Eclipse already provisioned. It will not be installed."
    echo "------------------------"
else
	
    echo 'Install Eclipse JEE MARS...'
    echo "------------------------"
 #   wget http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/kepler/SR2/eclipse-jee-kepler-SR2-linux-gtk-       x86_64.tar.gz -P /tmp

    wget http://eclipse.mirror.garr.it/mirrors/eclipse//technology/epp/downloads/release/mars/2-RC3/eclipse-jee-mars-2-RC3-linux-gtk-x86_64.tar.gz   -P /tmp

     #wget http://192.168.99.100:8081/artifactory/eclipse-ide-local/eclipse-jee-mars-2-RC3-linux-gtk-x86_64.tar.gz -P /tmp

    tar xzf /tmp/eclipse-jee-*-linux-gtk*.tar.gz -C $TOOLS_HOME
    sudo ln -s $ECLIPSE_HOME/eclipse /usr/bin/eclipse
    sudo cp /vagrant/settings/desktop/Eclipse.desktop $DEV_DESKTOP
    sudo chmod +x $DEV_DESKTOP/Eclipse.desktop
    rm /tmp/eclipse-jee-*-linux-gtk*.tar.gz
fi


echo 'Install Eclipse Plugins...'
echo "------------------------"
$ECLIPSE_HOME/eclipse -consolelog -nosplash -data /tmp \
      -application org.eclipse.ant.core.antRunner \
      -f $ECLIPSE_SETTINGS/director.xml \
      -DtargetDir=$ECLIPSE_HOME \
      -DsourceSites=http://download.eclipse.org/releases/mars,http://download.eclipse.org/eclipse/updates/4.5,http://download.eclipse.org/technology/m2e/releases,http://subclipse.tigris.org/update_1.10.x,http://dist.springsource.com/release/TOOLS/update/e4.5 \
      -Dinstall=org.eclipse.m2e.logback.feature.feature.group,org.tigris.subversion.subclipse.feature.group,org.tigris.subversion.subclipse.mylyn.feature.group,org.tigris.subversion.clientadapter.feature.feature.group,org.tigris.subversion.clientadapter.javahl.feature.feature.group,org.tigris.subversion.subclipse.graph.feature.feature.group,org.tigris.subversion.clientadapter.svnkit.feature.feature.group,com.collabnet.subversion.merge.feature.feature.group,org.springframework.ide.eclipse.feature.feature.group,org.springframework.ide.eclipse.autowire.feature.feature.group,org.springframework.ide.eclipse.aop.feature.feature.group,org.springframework.ide.eclipse.batch.feature.feature.group,org.springframework.ide.eclipse.integration.feature.feature.group,org.springframework.ide.eclipse.maven.feature.feature.group,org.springframework.ide.eclipse.security.feature.feature.group,org.springframework.ide.eclipse.data.feature.feature.group,org.springframework.ide.eclipse.webflow.feature.feature.group,org.sonatype.m2e.egit.feature.feature.group
