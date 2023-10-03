#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade Azure CLI
echo "Upgrading Azure CLI..."
brew upgrade azure-cli

echo "Azure CLI upgrade complete."

az --version