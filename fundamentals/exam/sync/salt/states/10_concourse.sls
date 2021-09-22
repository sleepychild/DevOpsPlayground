concourse:
  cmd.script:
    - name: "Run Concourse"
    - source: "/sync/scripts/concourse.sh"
    - creates: 
      - concourse/docker-compose.yml
    - retry:
        attempts: 10
        until: True
        interval: 60
        splay: 10
