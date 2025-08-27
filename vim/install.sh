#!/bin/bash

# Vim Configuration Installer
# Installs vim-plug and sets up the vim configuration
#
# Usage: curl -fsSL https://raw.githubusercontent.com/PierreKieffer/dotfiles/master/vim/install.sh | bash

set -e

echo "Installing Vim Configuration..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if vim is installed
if ! command -v vim &> /dev/null; then
    echo -e "${RED}Error: Vim is not installed. Please install vim first.${NC}"
    exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: Git is not installed. vim-plug requires git to download plugins.${NC}"
    exit 1
fi

echo -e "${YELLOW}Installing vim-plug...${NC}"
# Install vim-plug if not already installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo -e "${GREEN}vim-plug installed${NC}"
else
    echo -e "${GREEN}vim-plug already installed${NC}"
fi

echo -e "${YELLOW}Installing vimrc...${NC}"
# Download and install vimrc
curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/PierreKieffer/dotfiles/master/vim/vimrc
echo -e "${GREEN}vimrc installed${NC}"

echo -e "${YELLOW}Creating template directory...${NC}"
# Create templates directory
mkdir -p ~/.vim/templates
echo -e "${GREEN}Templates directory created${NC}"

echo -e "${YELLOW}Installing vim plugins...${NC}"
# Install plugins using vim in batch mode
vim -E -s <<EOF
:source ~/.vimrc
:PlugInstall
:qa!
EOF

echo -e "${YELLOW}Plugin installation completed${NC}"

# Check if plugins were installed
if [ -d ~/.vim/plugged ] && [ "$(ls -A ~/.vim/plugged 2>/dev/null)" ]; then
    plugin_count=$(ls -1 ~/.vim/plugged | wc -l)
    echo -e "${GREEN}Plugins installed successfully: $plugin_count plugins found${NC}"
else
    echo -e "${YELLOW}Warning: Plugin installation may have failed${NC}"
fi

echo -e "${GREEN}Vim configuration installed successfully!${NC}"
echo -e "${YELLOW}Optional: Add template files to ~/.vim/templates/${NC}"
echo -e "${YELLOW}Dependencies: Python (for JSON formatting), Git (for fugitive)${NC}"

echo ""
echo -e "${GREEN}=================================${NC}"
echo -e "${GREEN}INSTALLATION SUMMARY${NC}"
echo -e "${GREEN}=================================${NC}"
echo "Date: $(date)"
echo "User: $(whoami)"
echo ""
echo "Components installed:"
echo "- vim-plug: $([ -f ~/.vim/autoload/plug.vim ] && echo "✓ Installed" || echo "✗ Not found")"
echo "- vimrc: $([ -f ~/.vimrc ] && echo "✓ Installed" || echo "✗ Not found")"
echo "- Templates dir: $([ -d ~/.vim/templates ] && echo "✓ Created" || echo "✗ Not found")"
if [ -d ~/.vim/plugged ] && [ "$(ls -A ~/.vim/plugged 2>/dev/null)" ]; then
    echo "- Plugins: ✓ $(ls -1 ~/.vim/plugged | wc -l) plugins installed"
    echo "  Installed plugins: $(ls ~/.vim/plugged | tr '\n' ', ' | sed 's/,$//')"
else
    echo "- Plugins: ✗ No plugins found"
fi
echo ""
echo -e "${GREEN}Installation completed successfully!${NC}"
echo -e "${GREEN}=================================${NC}"
