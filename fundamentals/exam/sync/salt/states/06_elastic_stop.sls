stop.elasticsearch:
  service.dead:
    - name: elasticsearch
    - enable: False
    - reload: True

stop.logstash:
  service.dead:
    - name: logstash
    - enable: False
    - reload: True

stop.kibana:
  service.dead:
    - name: kibana
    - enable: False
    - reload: True

stop.heartbeat-elastic:
  service.dead:
    - name: heartbeat-elastic
    - enable: False
    - reload: True
