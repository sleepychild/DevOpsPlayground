install.docker:
  pkg:
    - installed
    - pkgs:
        - docker-ce 
        - docker-ce-cli
        - containerd.io

stop.docker:
  service.dead:
    - name: docker
    - enable: False
    - reload: True

vagrant:
  user.present:
    - optional_groups:
      - docker

/etc/docker/daemon.json:
  file.copy:
    - makedirs: true
    - source: /sync/etc/docker/daemon.json

/etc/systemd/system/docker.service.d/override.conf:
  file.copy:
    - makedirs: true
    - source: /sync/etc/systemd/system/docker.service.d/override.conf

setup.docker-compose:
  cmd.run:
    - name: 'curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'
    - creates: /usr/local/bin/docker-compose

/usr/local/bin/docker-compose:
  file.managed:
    - mode: 755

start.docker:
  service.running:
    - name: docker
    - enable: True
    - reload: True