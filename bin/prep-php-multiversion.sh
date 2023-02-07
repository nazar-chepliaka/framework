#!/bin/sh

sudo apt-get install software-properties-common -y


# https://www.digitalocean.com/community/tutorials/how-to-run-multiple-php-versions-on-one-server-using-apache-and-php-fpm-on-ubuntu-18-04
# | | | | | | | | | | | | | | | |
# V V V V V V V V V V V V V V V V
#
# The software-properties-common package provides the apt-add-repository command-line utility, which you will use to add the ondrej/php PPA (Personal Package Archive) repository.

sudo add-apt-repository ppa:ondrej/php
#
# todo: prepare variant with building from sources
#
sudo apt-get update -y

sudo apt-get install libapache2-mod-fcgid -y
sudo a2enmod actions fcgid alias proxy_fcgi

sudo apt-get install php7.0 php7.0-fpm php7.0-mysql libapache2-mod-php7.0 -y
sudo a2enconf php7.0-fpm

sudo apt-get install php7.1 php7.1-fpm php7.1-mysql libapache2-mod-php7.1 -y
sudo a2enconf php7.1-fpm

sudo apt-get install php7.2 php7.2-fpm php7.2-mysql libapache2-mod-php7.2 -y
sudo a2enconf php7.2-fpm

sudo apt-get install php7.3 php7.3-fpm php7.3-mysql libapache2-mod-php7.3 -y
sudo a2enconf php7.3-fpm

sudo apt-get install php7.4 php7.4-fpm php7.4-mysql libapache2-mod-php7.4 -y
sudo a2enconf php7.4-fpm

sudo apt-get install php8.0 php8.0-fpm php8.0-mysql libapache2-mod-php8.0 -y
sudo a2enconf php8.0-fpm

sudo apt-get install php8.1 php8.1-fpm php8.1-mysql libapache2-mod-php8.1 -y
sudo a2enconf php8.1-fpm


# Creating config file /etc/php/7.3/fpm/php.ini with new version
# NOTICE: Not enabling PHP 7.3 FPM by default.
# NOTICE: To enable PHP 7.3 FPM in Apache2 do:
# NOTICE: a2enmod proxy_fcgi setenvif
# NOTICE: a2enconf php7.3-fpm
# NOTICE: You are seeing this message because you have apache2 package installed.
# Created symlink /etc/systemd/system/multi-user.target.wants/php7.3-fpm.service → /lib/systemd/system/php7.3-fpm.service.
# Setting up php7.4-fpm (1:7.4.33-3+ubuntu20.04.1+deb.sury.org+1) ...
# Installing new version of config file /etc/apache2/conf-available/php7.4-fpm.conf ...
# Installing new version of config file /etc/logrotate.d/php7.4-fpm ...

# Configuration file '/etc/php/7.4/fpm/pool.d/www.conf'
#  ==> Modified (by you or by a script) since installation.
#  ==> Package distributor has shipped an updated version.
#    What would you like to do about it ?  Your options are:
#     Y or I  : install the package maintainer's version
#     N or O  : keep your currently-installed version
#       D     : show the differences between the versions
#       Z     : start a shell to examine the situation
#  The default action is to keep your current version.
# *** www.conf (Y/I/N/O/D/Z) [default=N] ?

# Переклад:

# В процесі встановлення було виявлено кастомні (tooltip: користувацькі) зміни в налаштуваннях які пропонується замінити налаштуваннями за замовчуванням
#     Y or I  : встановити налаштування за замовчуванням
#     N or O  : залишити кастомні (tooltip: користувацькі) зміни
#       D     : показати відмінності
#       Z     : start a shell to examine the situation


sudo systemctl restart apache2
sudo systemctl reload apache2


#/etc/apache2/apache2.conf
# | | | | | | | | | | | | | | | |
# V V V V V V V V V V V V V V V V
#
# These need to be set in /etc/apache2/envvars
#User ${APACHE_RUN_USER}
#Group ${APACHE_RUN_GROUP}



#/etc/apache2/envvars
# | | | | | | | | | | | | | | | |
# V V V V V V V V V V V V V V V V
#
#export APACHE_RUN_USER=nazar
#export APACHE_RUN_GROUP=nazar



#/etc/php/8.1/fpm/pool.d/www.conf
# | | | | | | | | | | | | | | | |
# V V V V V V V V V V V V V V V V
#
#; Unix user/group of processes
#; Note: The user is mandatory. If the group is not set, the default user's group
#;       will be used.
#user = www-data
#group = www-data

sudo systemctl restart php7.4-fpm
sudo systemctl restart php8.1-fpm



# Laravel extensions
# | | | | | | | | | | | | | | | |
# V V V V V V V V V V V V V V V V

sudo apt-get install php8.1-xml -y
sudo apt-get install php8.1-curl -y
sudo apt-get install php8.1-gd -y
sudo apt-get install php8.1-zip -y


# Composer install with specified php version
# | | | | | | | | | | | | | | | |
# V V V V V V V V V V V V V V V V

# /usr/bin/php8.1 /usr/local/bin/composer install