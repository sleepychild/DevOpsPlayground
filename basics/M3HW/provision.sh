#!/usr/bin/env bash

state_file="/sync/state"
host_index=$(echo $HOSTNAME | cut -d'-' -f 2)
ip_address=$(ip addr show dev eth1 | grep 'inet ' | cut -d'/' -f 1 | awk '{print $2}')

# Setup docker context
docker context create --docker host=tcp://localhost:2376 remote
docker context use remote

# Log Host
echo -e "$HOSTNAME:$ip_address" >> $state_file

# First host recreate state file
if [[ host_index -eq 1 ]]; then
    echo "First host set to manager and publish tokens and ip in state"
    docker swarm init --advertise-addr $ip_address
    DOCKER_SWARM_TOKEN_MANAGER=$(docker swarm join-token manager --quiet)
    DOCKER_SWARM_TOKEN_WORKER=$(docker swarm join-token worker --quiet)
    echo -e "MANAGER_TOKEN:$DOCKER_SWARM_TOKEN_MANAGER" >> $state_file
    echo -e "WORKER_TOKEN:$DOCKER_SWARM_TOKEN_WORKER" >> $state_file
elif [[ host_index -lt 3 ]]; then
    echo "Second host attach as manager with data from state file"
    manager_ip=$(cat /sync/state | grep dh-1 | cut -d":" -f 2)
    token=$(cat /sync/state | grep MANAGER | cut -d":" -f 2)
    docker swarm join --token $token $manager_ip:2377 --advertise-addr $ip_address
else
    echo "Subsequent hosts attach as worker with data from state file"
    manager_ip=$(cat /sync/state | grep dh-1 | cut -d":" -f 2)
    token=$(cat /sync/state | grep WORKER | cut -d":" -f 2)
    docker swarm join --token $token $manager_ip:2377 --advertise-addr $ip_address
fi

# re configure docker
sudo apk add python3
sudo /sync/fix_daemon.py
sudo rc-service docker stop
sudo rc-service docker start
