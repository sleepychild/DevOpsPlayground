install.filebeat:
  pkg.installed:
    - name: filebeat
    - refresh: True

configure.filebeat.elasticsearch:
  file.line:
    - name: /etc/filebeat/filebeat.yml
    - mode: replace
    - match: "output.elasticsearch:"
    - content: "#output.elasticsearch:"

configure.filebeat.elasticsearch.hosts:
  file.line:
    - name: /etc/filebeat/filebeat.yml
    - mode: replace
    - match: '  hosts: ["localhost:9200"]'
    - content: '  #hosts: ["main:9200"]'

configure.filebeat.logstash:
  file.line:
    - name: /etc/filebeat/filebeat.yml
    - mode: replace
    - match: "#output.logstash:"
    - content: "output.logstash:"

configure.filebeat.logstash.hosts:
  file.line:
    - name: /etc/filebeat/filebeat.yml
    - mode: replace
    - match: '  #hosts: ["localhost:5044"]'
    - content: '  hosts: ["main:5044"]'

setup.filebeat:
  cmd.script:
    - name: Setup filebeat
    - source: /sync/scripts/filebeat.sh
