#!/usr/bin/env bash

echo "PROVISION MASHINE $HOSTNAME"
sudo apt-get update
# sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install python3-pip

echo "Write sshd_config"

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

sudo systemctl restart sshd

if [[ $HOSTNAME == master ]]; then

sudo apt-get --assume-yes install ansible sshpass

echo "Write ansible config"

if [[ -f ansible.cfg ]]; then
    rm ansible.cfg
fi

tee <<EOF ansible.cfg
[defaults]
debug = True
enable_task_debugger = True
interpreter_python = /usr/bin/env python3
host_key_checking = False
inventory = /sync/inventory/
EOF

echo "Base Playbook"

ansible-playbook /sync/base_playbook.yml

fi
