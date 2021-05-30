#!/usr/bin/env bash

state_file="sync/state"

# If state file exists remove it
[[ -f $state_file ]] && rm $state_file

# If State file does not exist create it
[[ ! -f $state_file ]] && touch $state_file

vagrant up

# docker context use alpine_remote_dh1
# docker swarm init --advertise-addr 10.1.1.2

# DOCKER_SWARM_TOKEN_MANAGER=$(docker swarm join-token manager --quiet)
# DOCKER_SWARM_TOKEN_WORKER=$(docker swarm join-token worker --quiet)

# docker context use alpine_remote_dh2
# docker swarm join --token $DOCKER_SWARM_TOKEN_MANAGER 10.1.1.2:2376 --advertise-addr 10.1.1.3
