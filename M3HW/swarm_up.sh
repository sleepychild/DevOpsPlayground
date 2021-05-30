#!/usr/bin/env bash

state_file="sync/state"

# If state file exists remove it
[[ -f $state_file ]] && rm $state_file

# If State file does not exist create it
[[ ! -f $state_file ]] && touch $state_file

vagrant up

# Create docker context
docker context create remote --default-stack-orchestrator=swarm --docker host=tcp://localhost:2376
docker context use remote

# Create docker registry
docker service create --name registry --publish published=5000,target=5000 registry:2