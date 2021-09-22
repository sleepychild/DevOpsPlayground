#!/usr/bin/env bash

sudo filebeat modules enable system
sudo filebeat setup --template -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["main:9200"]'
