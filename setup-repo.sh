#!/bin/bash
# raj-host Repository Setup Script
# This script configures the raj-host APT repository for easy installation

set -e

echo ""
echo "======================================"
echo "  raj-host Repository Setup"
echo "======================================"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "This script requires root privileges. Rerunning with sudo..."
    exec sudo -E "$0" "$@"
fi

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Error: Cannot detect operating system"
    exit 1
fi

# Download and install bootstrap package
REPO_PACKAGE_URL="https://github.com/anayamathur/host/releases/download/v1.0.1/raj-host-repo_1.0.0_all.deb"
TEMP_DEB="/tmp/raj-host-repo.deb"

if [ "$OS" = "ubuntu" ] || [ "$OS" = "debian" ]; then
    echo "Detected Debian/Ubuntu system"
    echo "Downloading repository configuration package..."
    
    if command -v wget &> /dev/null; then
        wget -q -O "$TEMP_DEB" "$REPO_PACKAGE_URL"
    elif command -v curl &> /dev/null; then
        curl -fsSL -o "$TEMP_DEB" "$REPO_PACKAGE_URL"
    else
        echo "Error: Neither wget nor curl found. Please install one of them."
        exit 1
    fi
    
    echo "Installing repository configuration..."
    dpkg -i "$TEMP_DEB"
    rm -f "$TEMP_DEB"
    
    echo ""
    echo "✓ Setup complete!"
    echo ""
    echo "You can now install raj-host with:"
    echo "  sudo apt install raj-host"
    echo ""
    
elif [ "$OS" = "centos" ] || [ "$OS" = "rhel" ] || [ "$OS" = "fedora" ]; then
    echo "Detected RedHat/CentOS/Fedora system"
    echo "Adding YUM repository..."
    
    cat > /etc/yum.repos.d/raj-host.repo <<EOF
[raj-host]
name=raj-host Repository
baseurl=https://anayamathur.github.io/host/yum/packages
enabled=1
gpgcheck=0
EOF
    
    echo ""
    echo "✓ Setup complete!"
    echo ""
    echo "You can now install raj-host with:"
    echo "  sudo yum install raj-host"
    echo ""
else
    echo "Error: Unsupported operating system: $OS"
    exit 1
fi

exit 0
