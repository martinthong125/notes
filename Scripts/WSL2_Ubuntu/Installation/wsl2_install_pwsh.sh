#!/bin/bash

# Update the package lists for upgrades and new package installations
sudo apt-get update

# Install pre-requisite packages
sudo apt-get install -y wget apt-transport-https software-properties-common

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# Update the list of products
sudo apt-get update

# Enable the "universe" repositories
sudo add-apt-repository universe

# Install PowerShell
sudo apt-get install -y powershell

# Check PowerShell Version
pwsh --version
