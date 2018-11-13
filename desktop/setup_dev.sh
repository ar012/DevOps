#!/bin/bash

# Install Oracle JDK 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -y
sudo apt-get install oracle-java8-installer -y

# Verify the installation of Java
echo "Verify the installation of Java Version:"
java -version
sleep 2;

## Install GIT
sudo apt-get install git -y

## Verify the installation of GIT
echo "Verify the installation of GIT Version:"
git --version
sleep 2;

## Install PostgreSQL Database Server 9.5 and pgadmin3
sudo apt-get install postgresql-9.5 postgresql-client-9.5 postgresql-contrib-9.5 -y

sudo apt-get install pgadmin3 postgresql-client-9.5 postgresql-doc-9.5 -y

## Install PostgreSQL Database Server 9.6
#sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main"
#wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
#sudo apt-get update -y
#sudo apt-get install postgresql-9.6 postgresql-contrib-9.6 -y

## Setting a password for the postgres user
#echo "TYPE '\password postgres' Then Press ENTER, To Quit '\q'"
#sudo -u postgres psql postgres
echo "SET 'postgres' USER PASSWORD"
sudo -u postgres psql -c "\password"
sleep 2;

## Install Database client pgAdmin III
#sudo apt-get install pgadmin3 -y

## Install Sublime Text 3
#sudo add-apt-repository ppa:webupd8team/sublime-text-3
#sudo apt-get update -y
#sudo apt-get install sublime-text-installer -y

## Install Sublime stable version
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

##the latest development builds of Sublime Text
#echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update && sudo apt install sublime-text -y
sleep 2;
## Verify the installation
echo "Verify the installation of Java:"
java -version
echo "Verify the installation of GIT Version:"
git --version

echo "All Installation & Configuration Successfully done."
sleep 2;

echo "Now, You can open pgadmin3 and connect to Postgresql-Database..."

