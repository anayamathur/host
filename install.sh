#!/bin/bash

###############################################################################
# RAJ-HOST Universal Installer
# Automatically downloads and installs raj-host command globally
###############################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║              RAJ-HOST Universal Installer                 ║"
echo "║     Complete Web Server & Virtual Host Management         ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Error: Please run as root or using sudo${NC}"
    echo "Usage: sudo bash install.sh"
    exit 1
fi

# Determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${YELLOW}Installing raj-host to /usr/local/bin...${NC}"

# Check if raj-host exists in current directory
if [ -f "$SCRIPT_DIR/raj-host" ]; then
    cp "$SCRIPT_DIR/raj-host" /usr/local/bin/raj-host
    chmod +x /usr/local/bin/raj-host
elif [ -f "./raj-host" ]; then
    cp ./raj-host /usr/local/bin/raj-host
    chmod +x /usr/local/bin/raj-host
else
    echo -e "${RED}Error: raj-host script not found${NC}"
    exit 1
fi

# Verify installation
if [ -f "/usr/local/bin/raj-host" ]; then
    echo -e "${GREEN}✓ Installation successful!${NC}"
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}raj-host command is now available globally!${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}Usage:${NC}"
    echo -e "  ${GREEN}sudo raj-host${NC}"
    echo ""
    echo -e "${YELLOW}Features:${NC}"
    echo -e "  ✓ Nginx installation & configuration"
    echo -e "  ✓ PHP-FPM (7.4, 8.0, 8.1, 8.2, 8.3)"
    echo -e "  ✓ MySQL/MariaDB installation"
    echo -e "  ✓ SSL/TLS (Let's Encrypt + Custom)"
    echo -e "  ✓ Virtual host management"
    echo ""
    echo -e "${YELLOW}To uninstall:${NC}"
    echo -e "  ${GREEN}sudo rm /usr/local/bin/raj-host${NC}"
    echo ""
    echo -e "${GREEN}Ready to use! Run: ${YELLOW}sudo raj-host${NC}"
else
    echo -e "${RED}✗ Installation failed${NC}"
    exit 1
fi
