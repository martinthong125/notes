#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade Docker
echo "Upgrading Docker..."
brew upgrade --cask docker

echo "Docker upgrade complete."

docker --version