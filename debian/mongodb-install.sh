#!/bin/bash
sudo apt install dirmngr gnupg apt-transport-https software-properties-common ca-certificates curl
curl -fsSL https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main'
sudo apt update
sudo apt install mongodb-org

