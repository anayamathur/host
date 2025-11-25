#!/bin/bash

# RAJ-HOST Quick Package Installer
# One-command automatic installation for all platforms

set -e

REPO_URL="https://anayamathur.github.io/host"
RELEASE_URL="https://github.com/anayamathur/host/releases/download/v1.0.1"

echo -e "\033[0;36m"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║           RAJ-HOST Automatic Installer v1.0.1             ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
else
    echo -e "\033[0;31mError: Cannot detect OS\033[0m"
    exit 1
fi

echo -e "\033[1;33mDetected OS: $OS $VER\033[0m"
echo ""

# Install based on OS
case $OS in
    ubuntu|debian|linuxmint|pop)
        echo -e "\033[1;33m📦 Installing via APT...\033[0m"
        echo ""
        
        # Add repository
        echo -e "\033[0;36m[1/3] Adding RAJ-HOST repository...\033[0m"
        echo "deb [trusted=yes] $REPO_URL/debian stable main" | sudo tee /etc/apt/sources.list.d/raj-host.list > /dev/null
        
        # Update package list
        echo -e "\033[0;36m[2/3] Updating package lists...\033[0m"
        sudo apt update -qq
        
        # Install package
        echo -e "\033[0;36m[3/3] Installing raj-host...\033[0m"
        sudo apt install -y raj-host
        
        echo ""
        echo -e "\033[0;32m✓ Installation complete via APT!\033[0m"
        ;;
        
    centos|rhel|fedora|rocky|almalinux)
        echo -e "\033[1;33m📦 Installing via YUM/DNF...\033[0m"
        echo ""
        
        # Detect package manager
        if command -v dnf &> /dev/null; then
            PKG_MGR="dnf"
        else
            PKG_MGR="yum"
        fi
        
        # Add repository
        echo -e "\033[0;36m[1/3] Adding RAJ-HOST repository...\033[0m"
        sudo tee /etc/yum.repos.d/raj-host.repo > /dev/null <<EOF
[raj-host]
name=RAJ-HOST Repository
baseurl=$REPO_URL/yum/packages
enabled=1
gpgcheck=0
EOF
        
        # Update cache
        echo -e "\033[0;36m[2/3] Updating package cache...\033[0m"
        sudo $PKG_MGR makecache -q
        
        # Install package
        echo -e "\033[0;36m[3/3] Installing raj-host...\033[0m"
        sudo $PKG_MGR install -y raj-host
        
        echo ""
        echo -e "\033[0;32m✓ Installation complete via $PKG_MGR!\033[0m"
        ;;
        
    darwin)
        echo -e "\033[1;33m🍺 Installing via Homebrew...\033[0m"
        echo ""
        
        if ! command -v brew &> /dev/null; then
            echo -e "\033[0;31mError: Homebrew not found\033[0m"
            echo "Please install Homebrew first: https://brew.sh"
            exit 1
        fi
        
        echo -e "\033[0;36m[1/2] Adding tap...\033[0m"
        brew tap anayamathur/raj-host https://github.com/anayamathur/host
        
        echo -e "\033[0;36m[2/2] Installing raj-host...\033[0m"
        brew install raj-host
        
        echo ""
        echo -e "\033[0;32m✓ Installation complete via Homebrew!\033[0m"
        ;;
        
    *)
        echo -e "\033[0;33mWarning: Unsupported OS: $OS\033[0m"
        echo ""
        echo -e "\033[1;33m📦 Falling back to direct package download...\033[0m"
        echo ""
        
        # Try to detect package format
        if command -v dpkg &> /dev/null; then
            echo -e "\033[0;36mDownloading .deb package...\033[0m"
            TEMP_DEB=$(mktemp)
            curl -fsSL "$RELEASE_URL/raj-host_1.0.0_all.deb" -o "$TEMP_DEB"
            sudo dpkg -i "$TEMP_DEB"
            rm -f "$TEMP_DEB"
            echo -e "\033[0;32m✓ Installation complete!\033[0m"
        elif command -v rpm &> /dev/null; then
            echo -e "\033[0;36mDownloading .rpm package...\033[0m"
            TEMP_RPM=$(mktemp)
            curl -fsSL "$RELEASE_URL/raj-host-1.0.0-1.el8.noarch.rpm" -o "$TEMP_RPM"
            sudo rpm -i "$TEMP_RPM"
            rm -f "$TEMP_RPM"
            echo -e "\033[0;32m✓ Installation complete!\033[0m"
        else
            echo -e "\033[0;31mError: No supported package manager found\033[0m"
            echo ""
            echo "Please install manually:"
            echo "  https://github.com/anayamathur/host/releases"
            exit 1
        fi
        ;;
esac

echo ""
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[0;32m✓ RAJ-HOST installed successfully!\033[0m"
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "\033[1;33mUsage:\033[0m"
echo -e "  \033[0;32msudo raj-host\033[0m"
echo ""
echo -e "\033[1;33mFeatures:\033[0m"
echo "  ✓ Nginx + PHP-FPM + MySQL/MariaDB setup"
echo "  ✓ SSL/TLS support with Let's Encrypt"
echo "  ✓ Virtual host management"
echo "  ✓ Multiple PHP versions (7.4, 8.0, 8.1, 8.2, 8.3)"
echo ""
echo -e "\033[0;32mReady to use! Run: \033[1;33msudo raj-host\033[0m"
echo ""
