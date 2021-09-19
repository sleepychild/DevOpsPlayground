install.elasticsearch:
  pkgrepo.managed:
    - humanname: ElasticSearch
    - name: deb https://artifacts.elastic.co/packages/7.x/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elasticsearch.list
    - keyid: D88E42B4
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: elasticsearch
    - retry:
      attempts: 10

  pkg.latest:
    - name: elasticsearch
    - refresh: True

configure.elasticsearch.cluster.name:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#cluster.name:"
    - content: "cluster.name: vagrant"

configure.elasticsearch.node.name:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#node.name:"
    - content: "node.name: main"

configure.elasticsearch.network.host:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#network.host:"
    - content: "network.host: 0.0.0.0"

configure.elasticsearch.discovery.seed_hosts:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#discovery.seed_hosts:"
    - content: 'discovery.seed_hosts: ["node1", "node2"]'

configure.elasticsearch.cluster.initial_master_nodes:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#cluster.initial_master_nodes:"
    - content: 'cluster.initial_master_nodes: ["main"]'

start.elasticsearch:
  service.running:
    - name: elasticsearch
    - enable: True
    - reload: True
    - require:
      - pkg: elasticsearch