#!/bin/bash

mkdir tfsbuildagent && cd tfsbuildagent
sudo chown -R vagrant:vagrant /home/vagrant/tfsbuildagent
wget https://go.microsoft.com/fwlink/?linkid=842099 -O agent.tar.gz --progress=bar:force
tar zxvf agent.tar.gz

wget https://raw.githubusercontent.com/Microsoft/vsts-agent/master/src/Misc/layoutbin/installdependencies.sh --progress=bar:force
chmod +x installdependencies.sh
sudo ./installdependencies.sh

cd /home/vagrant/tfsbuildagent && ./config.sh --unattended --acceptteeeula --url http://tools-dev0:8080/tfs --auth Negotiate --username "$1" --password $2 --pool dev-agents-linux --agent $3
sudo ./svc.sh install
sudo ./svc.sh start