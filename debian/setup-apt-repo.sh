#!/bin/bash
# RAJ-HOST APT Repository Setup Script

set -e

REPO_URL="https://anayamathur.github.io/host/debian"

echo "Setting up RAJ-HOST APT repository..."

# Add repository to sources list
echo "deb [trusted=yes] $REPO_URL stable main" | sudo tee /etc/apt/sources.list.d/raj-host.list

# Update package lists
sudo apt update

echo "✓ RAJ-HOST repository added successfully!"
echo ""
echo "Install RAJ-HOST with:"
echo "  sudo apt install raj-host"
