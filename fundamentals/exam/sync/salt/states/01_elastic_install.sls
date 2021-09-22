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

configure.elasticsearch.bootstrap.memory_lock:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#bootstrap.memory_lock: true"
    - content: "bootstrap.memory_lock: false"

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

# at least one of [discovery.seed_hosts, discovery.seed_providers, cluster.initial_master_nodes] must be configured

# No need for clustering
# configure.elasticsearch.discovery.seed_hosts:
#   file.line:
#     - name: /etc/elasticsearch/elasticsearch.yml
#     - mode: replace
#     - match: "#discovery.seed_hosts:"
#     - content: 'discovery.seed_hosts: ["node1", "node2"]'

configure.elasticsearch.cluster.initial_master_nodes:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: replace
    - match: "#cluster.initial_master_nodes:"
    - content: 'cluster.initial_master_nodes: ["main"]'

/etc/elasticsearch/jvm.options.d/heapsize.options:
  file.copy:
    - makedirs: true
    - source: /sync/etc/elasticsearch/jvm.options.d/heapsize.options

install.logstash:
  pkg.installed:
    - name: logstash
    - refresh: True

configure.logstash.ms:
  file.line:
    - name: /etc/logstash/jvm.options
    - mode: replace
    - match: "-Xms1g"
    - content: '-Xms768m'

configure.logstash.mx:
  file.line:
    - name: /etc/logstash/jvm.options
    - mode: replace
    - match: "-Xmx1g"
    - content: '-Xmx768m'

# This has no effect
configure.logstash.MaxPermSize:
  file.append:
    - name: /etc/logstash/jvm.options
    - text: |

        # Set max perms size
        -XX:MaxPermSize=128mb

/etc/logstash/conf.d/beats.conf:
  file.copy:
    - makedirs: true
    - source: /sync/etc/logstash/conf.d/beats.conf

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

configure.kibana.uiSettings.overrides:
  file.append:
    - name: /etc/kibana/kibana.yml
    - text: |
        uiSettings:
          overrides:
            "theme:darkMode": true

configure.kibana.node.max_old_space_size:
  file.line:
    - name: /etc/kibana/node.options
    - mode: replace
    - match: "#--max-old-space-size=4096"
    - content: '--max-old-space-size=1024'
