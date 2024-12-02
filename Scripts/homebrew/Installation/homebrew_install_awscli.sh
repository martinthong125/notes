#!/bin/bash

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Installing now..."
    brew install awscli
else
    echo "AWS CLI is already installed."
fi

echo "Script execution complete."

aws --version
