#!/bin/bash

# Brew must be installed before continuing
brew -v >/dev/null 2>&1 || { echo "Homebrew is not installed!"; exit 1; }

vbox="http://download.virtualbox.org/virtualbox/5.0.10/VirtualBox-5.0.10-104061-OSX.dmg"
vbox_ext="http://download.virtualbox.org/virtualbox/5.0.10/Oracle_VM_VirtualBox_Extension_Pack-5.0.10-104061.vbox-extpack"
vagrant="https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.dmg"

echo "Updating formulas and Homebrew itself..."
brew update

echo "Adding homebrew/dupes repository..."
brew tap homebrew/dupes

echo "Adding homebrew/versions repository..."
brew tap homebrew/versions

echo "Adding homebrew/homebrew-php repository..."
brew tap homebrew/homebrew-php

echo "Installing wget"
brew install wget

echo "Installing VirtualBox + Extension Pack and Vagrant"
wget "$vbox" -O /tmp/virtualbox.dmg
wget "$vbox_ext" -O /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.0.10-104061.vbox-extpack
wget "$vagrant" -O /tmp/vagrant.dmg

sudo hdiutil attach /tmp/virtualbox.dmg
sudo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target /
sudo hdiutil detach /Volumes/VirtualBox

sudo hdiutil attach /tmp/vagrant.dmg
sudo installer -package /Volumes/Vagrant/Vagrant.pkg -target /
sudo hdiutil detach /Volumes/Vagrant

open /tmp/Oracle_VM_VirtualBox_Extension_Pack-5.0.10-104061.vbox-extpack

echo "Installing PHP 7"
brew install homebrew/php/php70
echo 'export PATH=$(brew --prefix homebrew/php/php70)/bin:$PATH' >> ~/.zshrc

echo "Installing NodeJS"
brew install node

echo "Installing Composer"
brew install homebrew/php/composer

echo "Installing Bower"
npm install -g bower

echo "Installing Gulp"
npm install --global gulp

echo "Great! Your dev stack is installed."

exit 0
