#!/bin/bash

# 
# Add Jenkins slave node
# 

JENKINS_URL=$1
NODE_NAME=$2
NODE_SLAVE_HOME='/vagrant'
EXECUTORS=2
SSH_PORT=22
CRED_ID=$3
LABELS=docker
USERID=admin

cat <<EOF | java -jar /opt/jenkins-cli.jar -s $1 -http -auth admin:admin create-node $2
<slave>
  <name>${NODE_NAME}</name>
  <description>Jenkins Slave Node</description>
  <remoteFS>${NODE_SLAVE_HOME}</remoteFS>
  <numExecutors>${EXECUTORS}</numExecutors>
  <mode>NORMAL</mode>
  <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
  <launcher class="hudson.plugins.sshslaves.SSHLauncher" plugin="ssh-slaves@1.28.1">
    <host>${NODE_NAME}</host>
    <port>${SSH_PORT}</port>
    <credentialsId>${CRED_ID}</credentialsId>
    <sshHostKeyVerificationStrategy class="hudson.plugins.sshslaves.verifiers.NonVerifyingKeyVerificationStrategy"/>
  </launcher>
  <label>${LABELS}</label>
  <nodeProperties/>
  <userId>${USERID}</userId>
</slave>
EOF

