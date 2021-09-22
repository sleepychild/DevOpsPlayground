start.journalbeat:
  service.running:
    - name: journalbeat
    - enable: True
    - reload: True
