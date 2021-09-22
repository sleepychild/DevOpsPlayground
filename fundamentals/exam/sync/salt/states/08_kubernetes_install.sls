install.kubernetes:
  pkg:
    - installed
    - pkgs:
        - kubelet
        - kubeadm
        - kubectl

/etc/modules-load.d/k8s.conf:
  file.copy:
    - makedirs: true
    - source: /sync/etc/modules-load.d/k8s.conf

/etc/sysctl.d/k8s.conf:
  file.copy:
    - makedirs: true
    - source: /sync/etc/sysctl.d/k8s.conf

setup.kubernetes:
  cmd.run:
    - name: 'sudo sysctl --system'
