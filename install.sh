#!/bin/bash

# RAJ-HOST Bootstrap Installer
# This creates a global command that auto-downloads and runs raj-host

INSTALL_DIR="/usr/local/bin"
COMMAND_NAME="raj-host"
SCRIPT_URL="https://raw.githubusercontent.com/anayamathur/host/main/raj-host"

echo -e "\033[0;36m"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║           RAJ-HOST Bootstrap Installer                    ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

if [ "$EUID" -ne 0 ]; then 
    echo -e "\033[0;31mError: Please run with sudo\033[0m"
    echo "Usage: curl -s https://raw.githubusercontent.com/anayamathur/host/main/install.sh | sudo bash"
    exit 1
fi

echo -e "\033[1;33mCreating raj-host command...\033[0m"

# Create the wrapper script
cat > "$INSTALL_DIR/$COMMAND_NAME" << 'WRAPPER'
#!/bin/bash

# RAJ-HOST Auto-Downloader Wrapper
CACHE_DIR="/tmp/raj-host-cache"
SCRIPT_FILE="$CACHE_DIR/raj-host-main.sh"
SCRIPT_URL="https://raw.githubusercontent.com/anayamathur/host/main/raj-host"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "\033[0;31mError: raj-host requires sudo/root privileges\033[0m"
    echo "Usage: sudo raj-host"
    exit 1
fi

# Create cache directory
mkdir -p "$CACHE_DIR"

# Always download latest version (no cache for fresh updates)
echo -e "\033[1;36m⬇ Fetching latest raj-host version...\033[0m"
curl -fsSL "$SCRIPT_URL" -o "$SCRIPT_FILE" 2>/dev/null

if [ $? -ne 0 ]; then
    echo -e "\033[0;31m✗ Error: Failed to download raj-host\033[0m"
    echo "Please check your internet connection"
    exit 1
fi

chmod +x "$SCRIPT_FILE"
echo -e "\033[0;32m✓ Latest version ready!\033[0m"
echo ""

# Run the main script
bash "$SCRIPT_FILE" "$@"
WRAPPER

chmod +x "$INSTALL_DIR/$COMMAND_NAME"

echo -e "\033[0;32m✓ Installation successful!\033[0m"
echo ""
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[0;32mraj-host command is now available globally!\033[0m"
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "\033[1;33mUsage:\033[0m"
echo -e "  \033[0;32msudo raj-host\033[0m"
echo ""
echo -e "\033[1;33mFeatures:\033[0m"
echo "  ✓ Auto-downloads latest version"
echo "  ✓ Nginx + PHP-FPM + MySQL/MariaDB setup"
echo "  ✓ SSL/TLS support"
echo "  ✓ Virtual host management"
echo ""
echo -e "\033[0;32mReady! Just run: \033[1;33msudo raj-host\033[0m"
echo ""
