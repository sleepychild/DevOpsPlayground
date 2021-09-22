#!/usr/bin/env bash

sudo metricbeat setup --template -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["main:9200"]'
