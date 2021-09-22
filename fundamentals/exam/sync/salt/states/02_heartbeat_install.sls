install.heartbeat:
  pkg.installed:
    - name: heartbeat-elastic
    - refresh: True

configure.heartbeat.reload.enable:
  file.line:
    - name: /etc/heartbeat/heartbeat.yml
    - mode: replace
    - match: "  reload.enabled: false"
    - content: "  reload.enabled: true"

configure.heartbeat.reload.period:
  file.line:
    - name: /etc/heartbeat/heartbeat.yml
    - mode: replace
    - match: "  reload.period: 5s"
    - content: "  reload.period: 60s"

configure.heartbeat.elasticsearch:
  file.line:
    - name: /etc/heartbeat/heartbeat.yml
    - mode: replace
    - match: "output.elasticsearch:"
    - content: "#output.elasticsearch:"

configure.heartbeat.elasticsearch.hosts:
  file.line:
    - name: /etc/heartbeat/heartbeat.yml
    - mode: replace
    - match: '  hosts: ["localhost:9200"]'
    - content: '  #hosts: ["main:9200"]'

setup.heartbeat:
  cmd.script:
    - name: Setup Heartbeat
    - source: /sync/scripts/heartbeat.sh

configure.heartbeat.logstash:
  file.line:
    - name: /etc/heartbeat/heartbeat.yml
    - mode: replace
    - match: "#output.logstash:"
    - content: "output.logstash:"

configure.heartbeat.logstash.hosts:
  file.line:
    - name: /etc/heartbeat/heartbeat.yml
    - mode: replace
    - match: '  #hosts: ["localhost:5044"]'
    - content: '  hosts: ["main:5044"]'

/etc/heartbeat/monitors.d/base.icmp.yml:
  file.copy:
    - makedirs: true
    - source: /sync/etc/heartbeat/monitors.d/base.icmp.yml
