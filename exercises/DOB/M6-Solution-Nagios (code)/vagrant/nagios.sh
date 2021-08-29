#!/bin/bash

echo "* Add hosts ..."
echo "192.168.99.100 nagios.dob.lab nagios" >> /etc/hosts
echo "192.168.99.101 docker.dob.lab docker" >> /etc/hosts

echo "* SELinux in permisive mode ..."
setenforce 0

echo "* Prepare the repositories ..."
dnf install -y epel-release
dnf config-manager --set-enabled powertools

echo "* Install Nagios ..."
dnf install -y nagios nagios-plugins-all nagios-plugins-nrpe

echo "* Set password (Password1) for nagiosadmin ..."
htpasswd -b /etc/nagios/passwd nagiosadmin Password1

echo "* Add some nice logos ..."
cp /vagrant/logos/*.png /usr/share/nagios/html/images/logos

echo "* Add/change Nagios configuration files ..."
cp /vagrant/cfg/localhost.cfg /etc/nagios/objects/localhost.cfg
mkdir -p /etc/nagios/conf.d
echo "cfg_dir=/etc/nagios/conf.d" | tee -a /etc/nagios/nagios.cfg
cp /vagrant/custom/* /etc/nagios/conf.d

echo "* Start and enable Nagios ..."
systemctl enable nagios 
systemctl start nagios

echo "* Start and enable Apache HTTP ..."
systemctl enable httpd
systemctl start httpd

echo "* Firewall - open port 80 ..."
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload