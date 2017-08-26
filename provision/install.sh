#!/usr/bin/env bash

#== Import script args ==

timezone=$(echo "$1")
env=$(echo "$2")
user=$(echo "$3")
group=$(echo "$4")


#This makes debconf use a frontend that expects no interactive input at all, preventing it from even trying to access stdin
export DEBIAN_FRONTEND=noninteractive

#== Bash helpers ==

function info {
  echo " "
  echo "--> $1"
  echo " "
}

#== Provision script ==

info "Provision-script user: `whoami`"




info "Configure timezone"
echo ${timezone} | tee /etc/timezone

# Update Ubuntu
sudo apt-get update

#Install BUndler for jekyll
echo "-------provision: installing Gems"
gem install bundler
gem install fontcustom -v 1.3.8

#Install packages for jekyll

apt-get install -y unzip aspell aspell-en build-essential graphviz gnuplot s3cmd fontforge liblapack-dev

echo "------provision: install npm"
apt-get -y install npm openjdk-8-jre
echo "done!"

# Install Git clone of @Tarun sir blog
#echo "------provision: Installing blog"
#git clone https://github.com/tarunjangra/blog.git

cd /vagrant
set -e 

# Install Aditional packages for jekyll
echo "-------provition: installing another packagess"
_travis/install_cmake.sh
sudo apt-get install -y libxml2-utils
npm install cssshrink@0.0.5
_travis/install_sfnt2woff.sh
_travis/install_tidy.sh
_travis/install_plantuml.sh
apt-get update
_travis/install_plantuml.sh
apt-get -f install
apt-get install openjdk-9-jre
