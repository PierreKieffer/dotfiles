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
# Install plugins (suppress terminal warning and color scheme errors)
vim -E -s -u ~/.vimrc +PlugInstall +qall >/dev/null 2>&1

# Verify plugin installation by checking if expected plugins exist
expected_plugins="ale vim-commentary vim-markdown-toc lightline.vim nerdtree ctrlp.vim vim-multiple-cursors vim-fugitive vim-markdown vim-surround vim-go nord-vim papercolor-theme"
installed_count=0
failed_plugins=""

for plugin in $expected_plugins; do
    # Check common plugin directory naming patterns
    if [ -d ~/.vim/plugged/"$plugin" ] || [ -d ~/.vim/plugged/"${plugin#vim-}" ] || [ -d ~/.vim/plugged/"${plugin%.vim}" ]; then
        installed_count=$((installed_count + 1))
    else
        failed_plugins="$failed_plugins $plugin"
    fi
done

if [ $installed_count -eq 0 ]; then
    echo -e "${RED}Error: No plugins were installed${NC}"
elif [ -n "$failed_plugins" ]; then
    echo -e "${YELLOW}Warning: Some plugins may have failed to install:$failed_plugins${NC}"
    echo -e "${GREEN}Successfully installed: $installed_count plugins${NC}"
else
    echo -e "${GREEN}All plugins installed successfully: $installed_count plugins${NC}"
fi
