#!/bin/bash

# Vim Configuration Installer
# Installs vim-plug and sets up the vim configuration
#
# Usage: curl -fsSL https://raw.githubusercontent.com/PierreKieffer/dotfiles/master/vim/install.sh | bash

set -euo pipefail

echo "Installing Vim Configuration..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
LOG_FILE="/tmp/vim_plugin_install.log"

# Check deps
if ! command -v vim &> /dev/null; then
    echo -e "${RED}Error: Vim is not installed. Please install vim first.${NC}"
    exit 1
fi
if ! command -v git &> /dev/null; then
    echo -e "${RED}Error: Git is not installed. vim-plug requires git to download plugins.${NC}"
    exit 1
fi

echo -e "${YELLOW}Installing vim-plug...${NC}"
if [ ! -f "${HOME}/.vim/autoload/plug.vim" ]; then
    curl -fLo "${HOME}/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo -e "${GREEN}vim-plug installed${NC}"
else
    echo -e "${GREEN}vim-plug already installed${NC}"
fi

echo -e "${YELLOW}Installing vimrc...${NC}"
curl -fLo "${HOME}/.vimrc" \
    https://raw.githubusercontent.com/PierreKieffer/dotfiles/master/vim/vimrc
echo -e "${GREEN}vimrc installed${NC}"

echo -e "${YELLOW}Creating template directory...${NC}"
mkdir -p "${HOME}/.vim/templates"
echo -e "${GREEN}Templates directory created${NC}"

echo -e "${YELLOW}Installing vim plugins...${NC}"

# --- Auto TTY detection (A: TTY direct, B: via /dev/tty) ---
VIM_STATUS=0
set +e  # ne pas interrompre si vim renvoie ≠ 0; on gère après

if [ -t 0 ]; then
    # A: STDIN est un TTY (exécution locale)
    vim +PlugInstall +PlugStatus "+sleep 2" +qall
    VIM_STATUS=$?
elif [ -r /dev/tty ]; then
    # B: script via pipe (curl|bash) -> on fournit un TTY à Vim
    vim +PlugInstall +PlugStatus "+sleep 2" +qall </dev/tty
    VIM_STATUS=$?
else
    # Pas de TTY dispo : on préfère échouer explicitement
    echo -e "${RED}No TTY available. Run locally or via 'curl ... | bash' in a real terminal.${NC}"
    VIM_STATUS=1
fi

set -e

# Résumé + code retour
if [ "${VIM_STATUS}" -ne 0 ]; then
    echo -e "${YELLOW}Warning: Vim exited with status ${VIM_STATUS}.${NC}"
else
    echo -e "${GREEN}Plugins installation completed${NC}"
fi

echo -e "${GREEN}Installation done${NC}"

