
###############################################################
###############################################################

SHELL=/bin/bash

######## DEFINE ########
define PS1_VALUE 
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
PS1="$${debian_chroot:+($$debian_chroot)}➤ $${BLUE}\w$${NC}$${YELLOW}\$$(__git_ps1 ' [%s] ')$${NC}\$$ "
endef

define ALIASES
alias gg='cd /home/pierre/go/src'
alias pp='cd /home/pierre/workspace/pythonPackages'
alias :t='tree'
alias f='fg'
alias j='jobs'
alias v='vim'
alias vimt='vim -c NERDTreeToggle'
alias python=python3
alias pip=pip3
alias gs='git status'
alias gb='git branch --sort=-committerdate'
alias k='kubectl'
alias cs='tr -d "\n" | xclip -selection clipboard'
endef

define BASH_FUNCTIONS 
gp() {
	 git add . && git commit -m "$1" && git push
}
check() {
 git checkout "$1"
}
gc() {
	 git add . && git commit -m "$1"
}
vg(){
 grep -rn "$1" -e "$2" | vim - "+:set hlsearch | /$2"
}
tmp(){
 cd /tmp && mkdir -p "$1" && cd "$1"
}
endef 

export PS1_VALUE
export ALIASES
export BASH_FUNCTIONS
########################

.PHONY: vim

dry : 
	@cat Makefile

build : packages bash vim terminal python go docker source-install 

source-install : 
	@source ${HOME}/.bashrc
	@source /usr/lib/git-core/git-sh-prompt

bash: 
	@echo "------------------------------------"
	@echo "|    Bash session configuration    |"
	@echo "------------------------------------"
	@# ---- PS1 setup ----
	@echo "\n ---- Setup : PS1 ----"
	@echo "$$PS1_VALUE"
	@echo "$$PS1_VALUE" >> $(HOME)/.bashrc
	@# ---- aliases ---- 
	@echo "\n ---- Setup : aliases ----"
	@echo "$$ALIASES"
	@echo "$$ALIASES" >> $(HOME)/.bashrc
	@# ---- functions ---- 
	@echo "\n ---- Setup : bash functions ----"
	@echo "$$BASH_FUNCTIONS"
	@echo "$$BASH_FUNCTIONS" >> $(HOME)/.bashrc
	
terminal: 
	@echo "\n--------------------------------"
	@echo "|    Terminal configuration    |"
	@echo "--------------------------------"

vim: 
	@echo "\n---------------------------"
	@echo "|    VIM configuration    |"
	@echo "---------------------------"
	@echo "\n ---- Install : VIM ----"
	@sudo apt update && sudo apt install -y vim
	@echo "\n ---- Install : vim-plug ----"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "\n ---- Setup : vimrc ----"
	@cp vim/vimrc ${HOME}/.vimrc
	@echo "\n ---- Setup : plugins ----"
	@vim +'PlugInstall --sync' +qa
	@echo "\n ---- Setup : templates ----"
	@cp -r vim/templates ${HOME}/.vim/
	@echo "\n ---- Setup : colorscheme ----"
	@mkdir -p ${HOME}/.vim/colors
	@cp vim/colorscheme/nord.vim ${HOME}/.vim/colors/nord.vim
	@cp vim/colorscheme/lightline/custom_nord.vim ${HOME}/.vim/plugged/lightline.vim/autoload/lightline/colorscheme/
	

packages : 
	@echo "\n--------------------------"
	@echo "|    Packages install    |"
	@echo "--------------------------"
	@sudo apt update
	@sudo apt install -y git zip unzip curl wget tig tree

python: 
	@echo "\n-------------------------------"
	@echo "|    Python3 configuration    |"
	@echo "-------------------------------"
	@# ---- python default venv ----
	@sudo apt install -y python3-pip
	@sudo apt install -y python3-venv
	@pip3 install --upgrade pip
	@mkdir -p ${HOME}/venv
	@python3 -m venv ${HOME}/venv/dev
	@echo "source $$HOME/venv/dev/bin/activate" >> ${HOME}/.bashrc
	@sed -i 's/PS1="(dev) $${PS1:-}"/PS1="\\[\\033[1;34m\\]● (dev)\\[\\033[00m\\] $${PS1:-}"/' ${HOME}/venv/dev/bin/activate

go: 
	@echo "\n------------------------------"
	@echo "|    Golang configuration    |"
	@echo "------------------------------"

docker: 
	@echo "\n------------------------------"
	@echo "|    Docker configuration    |"
	@echo "------------------------------"
