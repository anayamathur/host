#!/bin/bash
# RAJ-HOST YUM Repository Setup Script

set -e

REPO_URL="https://anayamathur.github.io/host/yum/packages"

echo "Setting up RAJ-HOST YUM repository..."

# Create repo file
sudo tee /etc/yum.repos.d/raj-host.repo > /dev/null <<EOF
[raj-host]
name=RAJ-HOST Repository
baseurl=$REPO_URL
enabled=1
gpgcheck=0
EOF

echo "✓ RAJ-HOST repository added successfully!"
echo ""
echo "Install RAJ-HOST with:"
echo "  sudo yum install raj-host"
echo "  or"
echo "  sudo dnf install raj-host"
