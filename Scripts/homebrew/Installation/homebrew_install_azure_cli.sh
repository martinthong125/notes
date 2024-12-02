#!/bin/bash

# Check if Azure CLI is installed
if ! command -v az &> /dev/null
then
    echo "Azure CLI is not installed. Installing now..."
    brew install azure-cli
else
    echo "Azure CLI is already installed."
fi

echo "Script execution complete."

az --version
