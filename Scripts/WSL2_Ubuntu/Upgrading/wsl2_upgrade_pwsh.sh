#!/bin/bash

# Update the package lists for upgrades and new package installations
sudo apt-get update

# Upgrade PowerShell
sudo apt-get install -y powershell

# Verify the upgrade
pwsh --version
