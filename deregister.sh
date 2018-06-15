#!/bin/bash

cd $HOME/tfsbuildagent
sudo ./svc.sh stop
sudo ./svc.sh uninstall
./config.sh remove --unattended --auth Negotiate --username "$1" --password $2