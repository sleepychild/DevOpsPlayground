#!/usr/bin/env bash

sudo rm -rf concourse || true
sudo mkdir concourse || true
pushd concourse
    curl -O https://concourse-ci.org/docker-compose.yml
    docker-compose up -d
popd
