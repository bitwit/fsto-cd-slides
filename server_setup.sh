#!/bin/sh

###
# SET UP YOUR PERSONAL CONFIGURATION
# Note: Install and run this on a user with sudo access from their home folder i.e. ~/
#    - Make sure this file has execution permissions, $ chmod +x server_setup.sh
#    - Also, configure strider.upstart.conf in advance if you have environemnt variables to set
###
GIT_EMAIL="stridercd@yourdomain.com"
GIT_AUTHOR="Strider CD"

###
# Initial setup
###
# update ubuntu
sudo apt-get update
# Install python & essentials
sudo apt-get install -qq -y curl
sudo apt-get install -qq -y git-core
sudo apt-get install -qq -y python-software-properties python g++ make
# Needed for PhantomJS
sudo apt-get install -qq -y libfontconfig
# Node essentials
sudo apt-get install -qq -y build-essential libssl-dev

###
# If we intend to use git to add
# tagged commits to our repo, it should have an author identity
###
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_AUTHOR"
git config --global push.default simple

###
# Mongo DB
###
# Prepare mongodb, get up to date
touch /etc/apt/sources.list.d/mongo.list
sudo sh -c 'echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongo.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
# Update after adding mongo repo and install
sudo apt-get update
sudo apt-get install -qq -y mongodb-org

###
# Install NodeJS
###
sudo apt-get install -qq -y nodejs
sudo apt-get install -qq -y npm
# some legacy modules require it to bin /usr/bin/node
sudo ln -s /usr/bin/nodejs /usr/bin/node 
# fix permissions so we don't need to `sudo` during npm installs
sudo chown -R $USER /usr/local

###
# Install global node modules
###
npm install -g grunt-cli
npm install -g bower
npm install -g strider

# copy over our upstart script for automatic start on reboots
# and acces via commands like `sudo service strider start`
# see strider.upstart.conf for details, and environment settings
sudo cp ~/strider.upstart.conf /etc/init/strider.conf

