start.elasticsearch:
  service.running:
    - name: elasticsearch
    - enable: True
    - reload: True

start.logstash:
  service.running:
    - name: logstash
    - enable: True
    - reload: True

start.kibana:
  service.running:
    - name: kibana
    - enable: True
    - reload: True
