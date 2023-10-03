#!/bin/bash

# Check if PowerShell is installed
if ! command -v pwsh &> /dev/null
then
    echo "PowerShell is not installed. Installing now..."
    brew install --cask powershell
else
    echo "PowerShell is installed."
fi

pwsh --version