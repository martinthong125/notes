#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade Terraform
echo "Upgrading Terraform..."
brew upgrade terraform

echo "Terraform upgrade complete."

# Terraform version
terraform --version