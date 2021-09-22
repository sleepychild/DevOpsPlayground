addrepo.docker:
  cmd.script:
    - name: "Add Docker Repo"
    - source: "/sync/scripts/docker_repo.sh"
    - creates: 
      - /usr/share/keyrings/docker-archive-keyring.gpg
      - /etc/apt/sources.list.d/docker.list
    - retry:
        attempts: 10
        until: True
        interval: 60
        splay: 10
