
###############################################################
###############################################################


######## DEFINE ########
define PS1_VALUE 
PS1="$${debian_chroot:+($$debian_chroot)}> \[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\]\$$(__git_ps1 ' [%s] ')\[\033[00m\]\$$ "
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
alias cs='xclip -selection clipboard'
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
 cd /tmp && mkdir "$1" && cd "$1"
}
endef 

export PS1_VALUE
export ALIASES
export BASH_FUNCTIONS
########################

.PHONY: vim

install : bash terminal vim python go docker

bash: 
	@echo "------------------------------------"
	@echo "|    Bash session configuration    |"
	@echo "------------------------------------"
	@# ---- PS1 setup ----
	@echo "\n ---- Setup : PS1 ----"
	@echo "$$PS1_VALUE"
	@echo "$$PS1_VALUE" >> /tmp/app/test
	@# ---- aliases ---- 
	@echo "\n ---- Setup : aliases ----"
	@echo "$$ALIASES"
	@echo "$$ALIASES" >> /tmp/app/test
	@# ---- functions ---- 
	@echo "\n ---- Setup : bash functions ----"
	@echo "$$BASH_FUNCTIONS"
	@echo "$$BASH_FUNCTIONS" >> /tmp/app/test
	
terminal: 
	@echo "\n--------------------------------"
	@echo "|    Terminal configuration    |"
	@echo "--------------------------------"

vim: 
	@echo "\n---------------------------"
	@echo "|    VIM configuration    |"
	@echo "---------------------------"

python: 
	@echo "\n-------------------------------"
	@echo "|    Python3 configuration    |"
	@echo "-------------------------------"
	@# ---- python default venv ----
	# source /home/pierre/venv/trunk/bin/activate

go: 
	@echo "\n------------------------------"
	@echo "|    Golang configuration    |"
	@echo "------------------------------"

docker: 
	@echo "\n------------------------------"
	@echo "|    Docker configuration    |"
	@echo "------------------------------"
