#!/usr/bin/env bash

state_file="sync/state"

# If state file exists remove it
[[ -f $state_file ]] && rm $state_file

vagrant destroy --force --parallel

# Remove docker context
docker context use default
docker context rm remote
