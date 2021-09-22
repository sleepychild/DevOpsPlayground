[concourse-ci](http://localhost:8080) test / test

curl -o fly http://localhost:8080/api/v1/cli?arch=amd64&platform=linux
chmod +x fly
sudo mv fly /usr/local/bin/
fly --target ci login --concourse-url http://localhost:8080 -u test -p test
fly -t ci status
fly -t ci set-pipeline --pipeline base --config /sync/concourse/base.yml --non-interactive 
fly -t ci unpause-pipeline -p base

[Kibana](http://localhost:5601)