stop.filebeat:
  service.dead:
    - name: filebeat
    - enable: False
    - reload: True

stop.journalbeat:
  service.dead:
    - name: journalbeat
    - enable: False
    - reload: True

stop.metricbeat:
  service.dead:
    - name: metricbeat
    - enable: False
    - reload: True

