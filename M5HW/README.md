./deploy.sh
    vagrant up
        provision.sh
        provision_ansible.sh

Playbooks run:
    ansible-playbook /sync/base_playbook.yml
    ansible-playbook /sync/servers_playbook.yml
    ansible-playbook /sync/jenkins_master_playbook.yml

Manual steps to setup jenkins:
http://localhost:8080
    admin / vagrant
    Install Sugested Plugins


