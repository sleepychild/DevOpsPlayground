#!/usr/bin/env bash

state_file="sync/state"
swarm_file="sync/SwarmInit.json"

# If state file exists remove it
[[ -f $state_file ]] && rm $state_file
[[ -f $swarm_file ]] && rm $swarm_file

vagrant destroy --force --parallel

# Remove docker context
docker context use default
docker context rm remote
