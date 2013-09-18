cpconf2013-selenium
===================

This repository contains the Vagrant make file and puppet code used in for a talk at the cPanel Conference 2013.

Getting Started
===============
To get ready for the workshop please install git, the latest Vagrant (1.3.2), and the latest Virtualbox(4.2.18):

https://help.github.com/articles/set-up-git

https://www.virtualbox.org/wiki/Downloads

http://downloads.vagrantup.com/tags/v1.3.2

Clone this repository and cd into it. 

Inside the repository run the command:

vagrant up --provision

This will download the VM image we are basing off of, make a copy of it, and then run our puppet provisioning scripts to give you a fully setup VM.

Once the machine has finished provisioning type:

vagrant ssh

To login to the machine via a SSH connection. 

Website code resides in /var/www/html. 

Test code resides in /home/vagrant/src/cpconf-2013-tests


Code Used
============================================

Aristo jQuery UI Example Page:

https://github.com/taitems/Aristo-jQuery-UI-Theme

Selenium::Remote::Driver:

http://search.cpan.org/~aivaturi/Selenium-Remote-Driver/

php-webdriver (Facebook's PHP WebDriver bindings):

https://github.com/facebook/php-webdriver/

