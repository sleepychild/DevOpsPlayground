#!/usr/bin/env bash

# echo "Update system"
# sudo apk update && sudo apk upgrade

echo "Install Ansible"
sudo apk add ansible sshpass

echo "Write ansible config"
[[ -f ansible.cfg ]] && rm ansible.cfg
touch ansible.cfg
tee <<EOF > ansible.cfg
[defaults]
interpreter_python = /usr/bin/env python3
host_key_checking = False
inventory = /sync/inventory/
[ssh_connection]
scp_if_ssh=True
EOF

echo "Install ansible requirements"
ansible-galaxy install -r /sync/requirements.yml

echo "Role setup"
ansible-playbook /sync/base_playbook.yml