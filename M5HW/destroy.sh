#!/usr/bin/env bash

state_file="sync/state"
swarm_file="sync/SwarmInit.json"

jenkins_sync_file="sync/sync_result.out"
jenkins_pass_file="sync/initialAdminPassword"

# If file exists remove it
[[ -f $state_file ]] && rm $state_file
[[ -f $swarm_file ]] && rm $swarm_file

[[ -f $jenkins_sync_file ]] && rm $jenkins_sync_file
[[ -f $jenkins_pass_file ]] && rm $jenkins_pass_file

vagrant destroy --force --parallel

# Remove docker context
docker context use default
docker context rm remote

# Remove known hosts
ssh-keygen -f "/home/mario/.ssh/known_hosts" -R "[localhost]:2200"
ssh-keygen -f "/home/mario/.ssh/known_hosts" -R "[localhost]:2222"
