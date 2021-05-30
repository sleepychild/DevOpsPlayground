#!/usr/bin/env bash

# Setup docker context
docker context create --docker host=tcp://localhost:2376 remote
docker context use remote

# write host to sync
echo -e $(ip addr show dev eth1 | grep 'inet ' | cut -d'/' -f 1 | awk '{print $2}')'\t'$(hostname) >> /sync/hosts
