start.elasticsearch:
  service.running:
    - name: elasticsearch
    - enable: True
    - reload: True
    - require:
      - pkg: elasticsearch

start.logstash:
  service.running:
    - name: logstash
    - enable: True
    - reload: True
    - require:
      - pkg: logstash

start.kibana:
  service.running:
    - name: kibana
    - enable: True
    - reload: True
    - require:
      - pkg: kibana

start.heartbeat-elastic:
  service.running:
    - name: heartbeat-elastic
    - enable: True
    - reload: True
    - require:
      - pkg: heartbeat-elastic