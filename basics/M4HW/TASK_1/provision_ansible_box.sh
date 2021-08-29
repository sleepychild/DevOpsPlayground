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
EOF

echo "Install Docker"

# ansible docker_hosts -m zypper -a "name=docker state=latest" --become
# ansible docker_hosts -m systemd -a "name=docker state=started enabled=true" --become
# ansible docker_hosts -m user -a "name=vagrant groups=docker append=yes" --become

ansible-playbook /sync/install_docker.yml

echo "Deploy docker image"

ansible-playbook /sync/run_nginx_container.yml