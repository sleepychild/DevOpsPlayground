#!/bin/bash

hostnamectl set-hostname --static nagios.dob.lab

echo 'preserve_hostname: true' >> /etc/cloud/cloud.cfg

mkdir /vagrant

chown ec2-user:ec2-user /vagrant
