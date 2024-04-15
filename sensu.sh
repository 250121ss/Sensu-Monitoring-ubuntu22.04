#!/bin/bash

#       ==============================    YouTube:  https://www.youtube.com/@linuxnetworkinghelp  =============================
#
#         ====================================  Please Subscribe   === 

# Step 1: Update system and install prerequisites
sudo apt update
sudo apt install -y wget apt-transport-https gnupg2 software-properties-common

# Step 2: Add Sensu repository and install Sensu Go Backend
curl -s https://packagecloud.io/install/repositories/sensu/stable/script.deb.sh | sudo bash
sudo apt update
sudo apt install -y sensu-go-backend

# Step 3: Download sample configuration and start Sensu Go Backend
sudo curl -L https://docs.sensu.io/sensu-go/latest/files/backend.yml -o /etc/sensu/backend.yml
sudo systemctl start sensu-backend
sudo systemctl enable sensu-backend

# Step 4: Configure Sensu administrator username and password
export SENSU_BACKEND_CLUSTER_ADMIN_USERNAME=username
export SENSU_BACKEND_CLUSTER_ADMIN_PASSWORD=password
sensu-backend init

# Step 5: Configure Firewall
sudo ufw allow 3000
sudo ufw enable
sudo ufw status

echo "Sensu Monitoring has been installed and configured."
