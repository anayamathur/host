#!/bin/bash

# RAJ-HOST Zero-Setup Alias Installer
# Creates a shell alias that auto-downloads and runs raj-host

SHELL_RC=""

# Detect shell
if [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
elif [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
else
    SHELL_RC="$HOME/.bashrc"
fi

echo -e "\033[0;36m"
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║        RAJ-HOST Zero-Setup Alias Installer                ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

# Check if alias already exists
if grep -q "alias raj-host=" "$SHELL_RC" 2>/dev/null; then
    echo -e "\033[0;33mAlias already exists in $SHELL_RC\033[0m"
    echo "Updating to latest version..."
    sed -i '/alias raj-host=/d' "$SHELL_RC"
fi

# Add the alias
cat >> "$SHELL_RC" << 'EOF'

# RAJ-HOST Auto-Download Alias
alias raj-host='sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/anayamathur/host/main/raj-host)"'
EOF

echo -e "\033[0;32m✓ Alias installed successfully!\033[0m"
echo ""
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[0;32mSetup Complete!\033[0m"
echo -e "\033[0;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "\033[1;33mReload your shell:\033[0m"
echo -e "  \033[0;32msource $SHELL_RC\033[0m"
echo ""
echo -e "\033[1;33mThen simply run:\033[0m"
echo -e "  \033[0;32mraj-host\033[0m"
echo ""
echo -e "\033[1;33mFeatures:\033[0m"
echo "  ✓ No curl/wget needed manually"
echo "  ✓ Auto-downloads latest version on every run"
echo "  ✓ Just type 'raj-host' - that's it!"
echo ""
