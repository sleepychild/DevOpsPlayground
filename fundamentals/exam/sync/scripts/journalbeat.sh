#!/usr/bin/env bash

sudo journalbeat setup --template -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["main:9200"]'
