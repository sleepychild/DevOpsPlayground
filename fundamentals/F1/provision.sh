#!/usr/bin/env bash

echo "PROVISION MACHINE $HOSTNAME"

echo "Install python3-pip"
sudo apt-get update
sudo apt-get --assume-yes install python3-pip

echo "Write sshd_config"
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
