#!/usr/bin/env bash

echo "create network dob-network"
docker network create dob-network

echo "RUN STORAGE"
pushd dob-2021-04-exam/storage
docker image build -t img-storage .
docker container rm -f dob-storage || true
docker container run -d --net dob-network --name dob-storage -e MARIADB_ROOT_PASSWORD=Exam-2021 img-storage
popd

echo "RUN PRODUCER"
pushd dob-2021-04-exam/producer
docker image build -t img-producer .
docker container rm -f dob-producer || true
docker container run -d --net dob-network --name dob-producer img-producer
popd

echo "RUN CONSUMER"
pushd dob-2021-04-exam/consumer
docker image build -t img-consumer .
docker container rm -f dob-consumer || true
docker container run -d --net dob-network -p 5000:5000 --name dob-consumer img-consumer
popd
