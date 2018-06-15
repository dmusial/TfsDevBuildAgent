#!/bin/bash

mkdir $HOME/clair && cd $HOME/clair
cp /vagrant/clair/docker-compose.yml $HOME/clair

mkdir clair_config
cp /vagrant/clair/config.yaml $HOME/clair/clair_config

sudo docker-compose -f $HOME/clair/docker-compose.yml up -d

sudo curl -L https://github.com/optiopay/klar/releases/download/v2.1.1/klar-2.1.1-linux-amd64 -o /usr/bin/klar
sudo chmod +x /usr/bin/klar