#Provisioning Java development enviroment with Vagrant
## Prerequisite
* Vagrant  1.7.4
* Virtual Box  5.0.12
* vagrant-vb-guest plugin 0.11.0
* vagrant-librarian-puppet plugin 0.9.1

## Installation 
1. Install Vagrant for your OS from the official download page https://www.vagrantup.com/downloads.html
2. Install Virtualbox for your OS from the official download page https://www.virtualbox.org/wiki/Downloads
3. Once vagrant is installed run ```vagrant plugin install vagrant-librarian-puppet```
4. Once vagrant is installed run ```vagrant plugin install vagrant-vbguest```
5. From the directory where you cloned the git repo run ```cd xubuntu-64-java-developer```
6. Run ```vagrant up```
7. Once the VM is installed and tools provisioned you can ssh into VM using ```vagrant ssh``` or login through UI using username:*vagrant* passw:*vagrant*

## Tools Installed
* Maven 3 (shell provisioned)
* Java 8 (shell provisioned)
* Git (shell provisioned )
* Eclipse Mars (shell provisioned)
* Eclipse plug-ins through p2 director (subeclipse plugin, m2e connector for logback)
* Docker (puppet provisioned)

## Windows Users
This module is tested only on MAC OS 10.11.3.
Currently it seems that librarian-puppet has some problems on windows 7. As workaround you need to comment out the puppet provisioner in the Vagrantfile. Obviuosly you will not get docker provisioned in your VM.
Stay tuned as I'm testing the r10k puppet package manager (into the related git branch) in order to resolve this issue.

##TO DO
* TO enforce VM security
* To add m2e connector to eclipse for subeclipse and egit
* To add chrome browser
* To add Wildfly 10 or other java server
* To add database tooling such as squirrel
* To add test tools and API test such as SOAP UI
* To configure default maven settings
* To tune eclipse configuration such as workspace default dir, java coding conventions
* To import standard eclipse preferences
* To add multiple java runtime
* To set default eclipse init parameters
* To tuning VM parameters (memory, network, io)
* To set JAVA_HOME
* To investigate the use of puppet as central package and configuration management tool and avoid shell scripting. Need hands-on to proof real benefit of using puppet when comparing to pure shell scripting based provisioning