#!/usr/bin/env bash

echo "* Add hosts ..."
sudo echo "192.168.89.100 web.mario.lab web" >> /etc/hosts
sudo echo "192.168.89.101 db.mario.lab db" >> /etc/hosts

echo "* Install Software ..."
sudo apt-get install --assume-yes apache2 php php-mysqlnd

echo "* Copy web site files to /var/www/html/ ..."
sudo rm /var/www/html/index.html
sudo cp /synced/* /var/www/html
