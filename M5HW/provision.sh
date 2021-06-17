#!/usr/bin/env bash

echo "PROVISION MACHINE $HOSTNAME"

sudo apt-get update
# sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install python3-pip

echo "Write sshd_config"

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

sudo systemctl restart sshd

# This should go into a playbook
# state_file="/sync/state"
# host_index=$(echo $HOSTNAME | cut -d'-' -f 2)
# ip_address=$(ip addr show | grep 'inet 10.1.1.' | cut -d'/' -f 1 | awk '{print $2}')
# echo -e "$HOSTNAME:$ip_address" >> $state_file