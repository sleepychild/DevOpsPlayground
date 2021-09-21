addrepo.elasticsearch:
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
        until: True
        interval: 60
        splay: 10

install.elasticsearch:
  pkg.installed:
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

configure.elasticsearch.http.port:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#http.port: 9200"
    - content: "http.port: 9200"

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

install.logstash:
  pkg.installed:
    - name: logstash
    - refresh: True

/etc/logstash/conf.d/beats.conf:
  file.copy:
    - makedirs: true
    - source: /sync//etc/logstash/conf.d/beats.conf

install.kibana:
  pkg.installed:
    - name: kibana
    - refresh: True

configure.kibana.server.port:
  file.line:
    - name: /etc/kibana/kibana.yml
    - mode: replace
    - match: "#server.port: 5601"
    - content: 'server.port: 5601'

configure.kibana.server.host:
  file.line:
    - name: /etc/kibana/kibana.yml
    - mode: replace
    - match: "#server.host:"
    - content: 'server.host: "0.0.0.0"'

configure.kibana.server.name:
  file.line:
    - name: /etc/kibana/kibana.yml
    - mode: replace
    - match: "#server.name:"
    - content: 'server.name: "main"'

configure.kibana.elasticsearch.hosts:
  file.line:
    - name: /etc/kibana/kibana.yml
    - mode: replace
    - match: "#elasticsearch.hosts:"
    - content: 'elasticsearch.hosts: ["http://main:9200"]'

# Overwriting ILM policy is disabled. Set `setup.ilm.overwrite: true` for enabling.
configure.kibana.uiSettings.overrides:
  file.append:
    - name: /etc/kibana/kibana.yml
    - text: |
        uiSettings:
          overrides:
            "theme:darkMode": true
