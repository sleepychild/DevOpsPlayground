#!/usr/bin/env bash

echo "PROVISION ANSIBLE $HOSTNAME"

sudo apt-get --assume-yes install ansible sshpass

echo "Write ansible config"

if [[ -f ansible.cfg ]]; then
    rm ansible.cfg
fi

# For debuging add the two lines to ansible.cfg
# debug = True
# enable_task_debugger = True

tee <<EOF ansible.cfg
[defaults]
interpreter_python = /usr/bin/env python3
host_key_checking = False
inventory = /sync/inventory/
EOF

echo "Base Playbook"

ansible-playbook -vvvv /sync/base_playbook.yml
