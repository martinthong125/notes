#!/bin/bash

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade PowerShell
echo "Upgrading PowerShell..."
brew upgrade --cask powershell

echo "PowerShell upgrade complete."

# Powershell version
pwsh --version