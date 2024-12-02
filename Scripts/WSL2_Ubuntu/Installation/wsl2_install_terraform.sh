#!/bin/bash

# Specify the Terraform version
TERRAFORM_VERSION="1.5.7"

# Specify the directory for downloading and unzipping the file
DOWNLOAD_DIR="/tmp"

# Download the specified Terraform binary from the official website to the specified directory
wget -P $DOWNLOAD_DIR https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Unzip the downloaded file in the specified directory
unzip $DOWNLOAD_DIR/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d $DOWNLOAD_DIR

# Move the binary to /usr/local/bin
sudo mv $DOWNLOAD_DIR/terraform /usr/local/bin/

# Remove the zip file from the specified directory
rm $DOWNLOAD_DIR/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify the installation
terraform --version
