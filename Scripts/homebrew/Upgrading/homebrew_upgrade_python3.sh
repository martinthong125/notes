#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade Python 3
echo "Upgrading Python 3..."
brew upgrade python3

echo "Python 3 upgrade complete."

python3 --version