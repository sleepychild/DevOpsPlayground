stop.elasticsearch:
  service.dead:
    - name: elasticsearch
    - enable: False
    - reload: True
    - require:
      - pkg: elasticsearch

stop.logstash:
  service.dead:
    - name: logstash
    - enable: False
    - reload: True
    - require:
      - pkg: logstash

stop.kibana:
  service.dead:
    - name: kibana
    - enable: False
    - reload: True
    - require:
      - pkg: kibana

stop.heartbeat-elastic:
  service.running:
    - name: heartbeat-elastic
    - enable: False
    - reload: True
    - require:
      - pkg: heartbeat-elastic