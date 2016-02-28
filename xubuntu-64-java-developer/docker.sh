#!/usr/bin/env bash


#Need to define the versioning for docker
echo 'Install Docker...'
echo "------------------------"
apt-get -y install docker.io

ln -sf /usr/bin/docker.io /usr/local/bin/docker
sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io

echo 'Set Docker daemon to automatically start on ubuntu startup...'
echo "------------------------"
update-rc.d docker.io defaults


echo 'Install Docker Compose...'
echo "------------------------"
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
