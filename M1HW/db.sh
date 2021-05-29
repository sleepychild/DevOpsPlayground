#!/usr/bin/env bash

echo "* Add hosts ..."
sudo echo "192.168.89.100 web.mario.lab web" >> /etc/hosts
sudo echo "192.168.89.101 db.mario.lab db" >> /etc/hosts

echo "* Install Software ..."
sudo apt-get install --assume-yes mariadb-server mariadb-client

echo "* Allow remote connections on any interface"
sudo cp /synced/50-server.cnf /etc/mysql/mariadb.conf.d/
sudo systemctl restart mysqld

echo "* Create and load the database ..."
mysql -u root < /synced/db_setup.sql
