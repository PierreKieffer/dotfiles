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
# Install plugins with detailed output
vim -E -s -u ~/.vimrc +PlugInstall +PlugStatus +qall 2>&1 | tee /tmp/vim_plugin_install.log

# Check installation status
if vim -E -s -u ~/.vimrc -c 'PlugStatus' -c 'qall!' 2>&1 | grep -q "✗\|Error\|Failed"; then
    echo -e "${YELLOW}Some plugins failed to install. Check details:${NC}"
    vim -E -s -u ~/.vimrc -c 'PlugStatus' -c 'qall!' 2>&1 | grep -E "✗|Error|Failed|✓" || true
else
    echo -e "${GREEN}All plugins installed successfully${NC}"
fi
