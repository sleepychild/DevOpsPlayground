#!/usr/bin/env bash

echo "PROVISION ANSIBLE $HOSTNAME"

sudo apt-get --assume-yes install ansible sshpass

echo "Write ansible config"

# For debuging add the two lines to ansible.cfg
# debug = True
# enable_task_debugger = True

sudo mkdir /etc/ansible

tee -a <<EOF /etc/ansible/ansible.cfg
[defaults]
interpreter_python = /usr/bin/env python3
host_key_checking = False
inventory = /sync/inventory/
EOF

echo "Ansible Playbooks"

# Base
ansible-playbook /sync/base_playbook.yml
ansible-playbook /sync/servers_playbook.yml

# Docker
ansible-playbook /sync/docker_install_playbook.yml
