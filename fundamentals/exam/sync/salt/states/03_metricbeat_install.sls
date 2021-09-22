install.metricbeat:
  pkg.installed:
    - name: metricbeat
    - refresh: True

configure.metricbeat.elasticsearch:
  file.line:
    - name: /etc/metricbeat/metricbeat.yml
    - mode: replace
    - match: "output.elasticsearch:"
    - content: "#output.elasticsearch:"

configure.metricbeat.elasticsearch.hosts:
  file.line:
    - name: /etc/metricbeat/metricbeat.yml
    - mode: replace
    - match: '  hosts: ["localhost:9200"]'
    - content: '  #hosts: ["main:9200"]'

configure.metricbeat.logstash:
  file.line:
    - name: /etc/metricbeat/metricbeat.yml
    - mode: replace
    - match: "#output.logstash:"
    - content: "output.logstash:"

configure.metricbeat.logstash.hosts:
  file.line:
    - name: /etc/metricbeat/metricbeat.yml
    - mode: replace
    - match: '  #hosts: ["localhost:5044"]'
    - content: '  hosts: ["main:5044"]'

setup.metricbeat:
  cmd.script:
    - name: Setup Metricbeat
    - source: /sync/scripts/metricbeat.sh
