#!/usr/bin/env bash

state_file="/sync/state"
host_index=$(echo $HOSTNAME | cut -d'-' -f 2)
ip_address=$(ip addr show dev eth1 | grep 'inet ' | cut -d'/' -f 1 | awk '{print $2}')

# Setup docker context
docker context create --docker host=tcp://localhost:2376 remote
docker context use remote

# Log Host
echo -e $HOSTNAME"\t"$ip_address >> $state_file

# First host recreate state file
if [[ host_index -eq 1 ]]; then
    echo "First host set to manager and publis tokens and ip in state"
    
else
    echo "Not first host attach to manager with data from state file"

fi
