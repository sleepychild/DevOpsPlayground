#!/usr/bin/env bash

echo "Provision WEB"

echo "Write sshd_config"

tee <<EOF /etc/ssh/sshd_config
PasswordAuthentication yes
EOF

sudo systemctl restart sshd