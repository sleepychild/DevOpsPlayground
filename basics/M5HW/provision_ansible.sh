#!/usr/bin/env bash

echo "PROVISION ANSIBLE $HOSTNAME"

sudo apt-get --assume-yes install ansible sshpass

echo "Write ansible config"

# For debuging add the two lines to ansible.cfg
# debug = True
# enable_task_debugger = True

tee <<EOF /etc/ansible/ansible.cfg
[defaults]
interpreter_python = /usr/bin/env python3
host_key_checking = False
inventory = /sync/inventory/
EOF

echo "Ansible Playbooks"

# Smaller playbooks hang less often
ansible-playbook /sync/base_playbook.yml
ansible-playbook /sync/servers_playbook.yml

ansible-playbook /sync/jenkins_slave_playbook.yml
ansible-playbook /sync/jenkins_master_playbook.yml

ansible-playbook /sync/docker_install_playbook.yml
ansible-playbook /sync/docker_swarm_playbook.yml # vagrant needs to logout and login again to run docker commands

sleep 120 # we need to have a working swarm before we join it

ansible-playbook /sync/docker_join_playbook.yml