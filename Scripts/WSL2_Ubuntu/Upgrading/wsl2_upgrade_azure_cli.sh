#!/bin/bash

# Update the repository information
sudo apt-get update

# Install prerequisites
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg -y

# Download and install the Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

# Add the Azure CLI software repository
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update the repository information and install the Azure CLI
sudo apt-get update
sudo apt-get install azure-cli -y