#!/bin/bash

hostnamectl set-hostname --static ansible.dob.lab

echo 'preserve_hostname: true' >> /etc/cloud/cloud.cfg

mkdir /vagrant

echo "* Add hosts ..."
echo "172.31.37.75 jenkins.dob.lab jenkins" >> /etc/hosts
echo "172.31.37.76 nagios.dob.lab nagios" >> /etc/hosts
echo "172.31.37.77 docker.dob.lab docker" >> /etc/hosts
echo "172.31.37.78 ansible.dob.lab ansible" >> /etc/hosts

echo "* Install Ansible ..."
dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf install -y ansible unzip wget

echo "* Download user data ..."
wget 'https://drive.google.com/uc?export=download&id=1OYO03fKVyDgS-J-aOyf57mSl-3cefd9K' -O /tmp/data.zip

echo "* Extract user data ..."
unzip /tmp/data.zip -d /vagrant

echo "* Change key permissions ..."
chmod 0400 /vagrant/ansible/aws-key-pair.pem

echo "* Set Ansible configuration in /etc/ansible/ansible.cfg ..."
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg

echo "* Set Ansible global inventory in /etc/ansible/hosts ..."
cp /vagrant/ansible/hosts /etc/ansible/hosts

echo "* Copy Ansible playbooks in /playbooks/ ..."
cp -R /vagrant/ansible/playbooks /playbooks

echo "* Prepare /playbooks/roles folder ..."
cp -R /vagrant/ansible/roles /playbooks

echo "* Install Ansible role(s) for jenkins and docker in /playbooks/roles/ ..."
ansible-galaxy install geerlingguy.jenkins -p /playbooks/roles/
ansible-galaxy install geerlingguy.docker -p /playbooks/roles/
ansible-galaxy install geerlingguy.java -p /playbooks/roles/

echo "* Execute Ansible Playbooks ..."
ansible-playbook /playbooks/install-all.yml | tee /tmp/ansible.log
