install.journalbeat:
  pkg.installed:
    - name: journalbeat
    - refresh: True

configure.journalbeat.elasticsearch:
  file.line:
    - name: /etc/journalbeat/journalbeat.yml
    - mode: replace
    - match: "output.elasticsearch:"
    - content: "#output.elasticsearch:"

configure.journalbeat.elasticsearch.hosts:
  file.line:
    - name: /etc/journalbeat/journalbeat.yml
    - mode: replace
    - match: '  hosts: ["localhost:9200"]'
    - content: '  #hosts: ["main:9200"]'

configure.journalbeat.logstash:
  file.line:
    - name: /etc/journalbeat/journalbeat.yml
    - mode: replace
    - match: "#output.logstash:"
    - content: "output.logstash:"

configure.journalbeat.logstash.hosts:
  file.line:
    - name: /etc/journalbeat/journalbeat.yml
    - mode: replace
    - match: '  #hosts: ["localhost:5044"]'
    - content: '  hosts: ["main:5044"]'

setup.journalbeat:
  cmd.script:
    - name: Setup Journalbeat
    - source: /sync/scripts/journalbeat.sh
