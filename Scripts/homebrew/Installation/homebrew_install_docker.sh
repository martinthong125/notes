#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker is not installed. Installing now..."
    brew install --cask docker
else
    echo "Docker is already installed."
fi

echo "Script execution complete."

docker --version