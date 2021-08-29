#!/bin/bash

echo "* Update repositories information ..."
apt-get update -y

echo "* Install additional software ..."
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "* Install the Docker repository key ..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

echo "* Add the Docker repository ..."
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "* Install the Docker software ..."
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io

echo "* Add the ubuntu user to the docker group ..."
usermod -aG docker ubuntu