addrepo.kubernetes:
  cmd.script:
    - name: "Add Docker Repo"
    - source: "/sync/scripts/kubernetes_repo.sh"
    - creates: 
      - /usr/share/keyrings/kubernetes-archive-keyring.gpg
      - /etc/apt/sources.list.d/kubernetes.list
    - retry:
        attempts: 10
        until: True
        interval: 60
        splay: 10
