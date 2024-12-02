#!/bin/bash

# Check if Terraform is installed
if ! command -v terraform &> /dev/null
then
    echo "Terraform is not installed. Installing now..."
    brew install terraform
else
    echo "Terraform is already installed."
fi

terraform --version
