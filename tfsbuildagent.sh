#!/bin/bash

mkdir $HOME/tfsbuildagent && cd $HOME/tfsbuildagent
sudo chown -R vagrant:vagrant $HOME/tfsbuildagent
wget https://go.microsoft.com/fwlink/?linkid=842099 -O agent.tar.gz --progress=bar:force
tar zxvf agent.tar.gz

wget https://raw.githubusercontent.com/Microsoft/vsts-agent/master/src/Misc/layoutbin/installdependencies.sh --progress=bar:force
chmod +x installdependencies.sh
sudo ./installdependencies.sh

cd $HOME/tfsbuildagent && ./config.sh --unattended --acceptteeeula --url $5 --auth Negotiate --username "$1" --password $2 --pool $3 --agent $4
sudo ./svc.sh install
sudo ./svc.sh start