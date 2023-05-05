#!/bin/sh

sudo apt-get update -y

sudo apt install apache2

sudo apt install mysql-server

sudo apt install php libapache2-mod-php php-mysql

sudo a2enmod rewrite 

sudo service apache2 restart