#!/usr/bin/env bash

#docker-compose up -d

docker-compose build

docker-compose push

docker stack deploy --compose-file="docker-compose.yml" --orchestrator="swarm" m3hw

