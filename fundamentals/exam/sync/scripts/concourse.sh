#!/usr/bin/env bash

rm -rf concourse || true
mkdir concourse || true
pushd concourse
    curl -O https://concourse-ci.org/docker-compose.yml
    docker-compose up -d
popd

pushd /usr/local/bin/
    curl -o fly "http://localhost:8080/api/v1/cli?arch=amd64&platform=linux"
    chmod 755 fly
popd