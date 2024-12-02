#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade AWS CLI
echo "Upgrading AWS CLI..."
brew upgrade awscli

echo "AWS CLI upgrade complete."

aws --version
