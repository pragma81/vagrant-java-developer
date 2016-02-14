#!/usr/bin/env bash
set -e
# Directory in which PuppetFile is placed to be scanned by librarian-puppet.
PUPPET_DIR=/vagrant/puppet

echo "Installing Git.."
apt-get -q -y install git=1:1.9.1-1ubuntu0.2

echo -e "Installing ruby 2.0..."
sudo apt-get update
sudo apt-get install ruby2.0 ruby2.0-dev -y
for i in erb gem irb rake rdoc ri ruby testrb
do
  sudo ln -sf /usr/bin/${i}2.0 /usr/bin/${i}
done

echo "Installing Puppet repo for Ubuntu 14.04 Trusty LTS"
wget -qO /tmp/puppetlabs-release-trusty.deb \
        https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i /tmp/puppetlabs-release-trusty.deb
rm /tmp/puppetlabs-release-trusty.deb
aptitude update
echo Installing puppet
aptitude install -y puppet
echo "Puppet installed!"

#Current comaptible version are gem 1.8.23, librarian-puppet 2.1.0, ruby 2.0
echo "Installing librarian-puppet.."
if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  gem install librarian-puppet -v 2.0.0
fi
echo "librarian-puppet installed!"
echo "Executing PuppetFile.."
cd $PUPPET_DIR && librarian-puppet install --path modules

