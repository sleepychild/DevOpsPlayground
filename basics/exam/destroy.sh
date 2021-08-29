#!/usr/bin/env bash

vagrant destroy --force --parallel

state_file="sync/state"
swarm_file="sync/SwarmInit.json"

context_file="sync/remote.dockercontext"

jenkins_sync_file="sync/sync_result.out"
jenkins_pass_file="sync/initialAdminPassword"

nagios_sync_result="sync/nagios_sync_result.out"

./clear_builds.py

[[ -f $state_file ]] && rm $state_file
[[ -f $swarm_file ]] && rm $swarm_file

[[ -f $context_file ]] && rm $context_file

[[ -f $jenkins_sync_file ]] && rm $jenkins_sync_file
[[ -f $jenkins_pass_file ]] && rm $jenkins_pass_file

[[ -f $nagios_sync_result ]] && rm $nagios_sync_result

# Remove docker context
docker context use default
docker context rm remote

# Remove known hosts
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2200"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2201"
ssh-keygen -f ~/.ssh/known_hosts -R "[localhost]:2222"
