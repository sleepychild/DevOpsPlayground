install.base:
  pkg:
    - installed
    - pkgs:
      - mc
      - nano
      - curl
      - ca-certificates
      - gnupg
      - lsb-release
      - tmux
      - htop
      - iftop
      - python-apt
      - python3-pip
      - apt-transport-https

docker-py:
  pip.installed:
    - name: docker-py

docker:
  pip.installed:
    - name: docker

stop.multipathd.socket:
  service.dead:
    - name: multipathd.socket
    - enable: False
    - reload: True

stop.multipathd:
  service.dead:
    - name: multipathd
    - enable: False
    - reload: True
