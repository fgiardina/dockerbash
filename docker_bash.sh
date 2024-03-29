#!bin/bash

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y
docker --version
sudo curl -L "https://github.com/docker/compose/releases/download/v2.3.4/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
sudo apt-get install zip unzip
echo "alias dc='sudo docker-compose'" >> /home/ubuntu/.bashrc
echo "alias dcr='sudo docker-compose run --rm'" >> /home/ubuntu/.bashrc
source /home/ubuntu/.bashrc
