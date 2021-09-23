__Login__

fly --target ci login --concourse-url http://localhost:8080 -u test -p test

__Get Status__

fly -t ci status

__Execute Task File__
fly -t ci execute -c {task yml}
fly -t ci execute -c {task yml} -i {input name}={input value}

Inputs are folders.

__Create and Unpause Pipeline__
fly -t ci set-pipeline --pipeline {name} --config {pipeline yml} --non-interactive 
fly -t ci unpause-pipeline -p {name}
