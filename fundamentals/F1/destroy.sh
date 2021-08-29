#!/usr/bin/env bash

terraform destroy

vagrant destroy --force --parallel

# Remove docker context
docker context use default
docker context rm remote

# Remove known hosts
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2222"