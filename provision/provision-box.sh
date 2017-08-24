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
dpkg-reconfigure --frontend noninteractive tzdata

# Update Ubuntu
sudo apt-get update

#Install Apache2
echo "-------provision: Installing Apache2...."
sudo apt-get install -y apache2
sudo dpkg --configure -a
#Restart Apache service
echo "---------- Provision: Restarting Apache..."
sudo /etc/init.d/apache2 restart

