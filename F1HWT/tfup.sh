#!/usr/bin/env bash

terraform init
terraform plan -out=main.plan
terraform apply main.plan