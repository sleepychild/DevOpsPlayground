#!/usr/bin/env bash

# Update boxes
vagrant box update  # Get latest box version
vagrant box prune   # Remove older box versions

# Vagrant
vagrant up

# Create docker context
docker context create remote --default-stack-orchestrator=swarm --docker host=tcp://localhost:2375
docker context use remote

# Terraform
terraform init
terraform validate
terraform plan --out main.plan
terraform apply main.plan
