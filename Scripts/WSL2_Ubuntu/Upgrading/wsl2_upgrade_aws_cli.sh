#!/bin/bash

# Define the TMP_DIR variable
TMP_DIR=/tmp

# Update the repository information
sudo apt-get update

# Download the AWS CLI package
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "$TMP_DIR/awscliv2.zip"

# Unzip the downloaded package
unzip $TMP_DIR/awscliv2.zip -d $TMP_DIR/aws

# Install the AWS CLI
sudo $TMP_DIR/aws/aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

# Verify the installation by checking the AWS CLI version
aws --version

# Delete temp installation files
rm -rf $TMP_DIR/aws $TMP_DIR/awscliv2.zip
