#!/bin/bash

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null
then
    echo "Python 3 is not installed. Installing now..."
    brew install python3
else
    echo "Python 3 is already installed."
fi

echo "Script execution complete."

python3 --version