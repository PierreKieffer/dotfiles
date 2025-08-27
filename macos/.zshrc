# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pierre/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pierre/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pierre/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pierre/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$PATH:/opt/homebrew/bin/"
export PATH="$PATH:/Users/pierre/go/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias f='fg'
alias j='jobs'
alias v='vim'
alias vimt='vim -c NERDTreeToggle'
alias vimp='vim -c CtrlP'
alias python=python3
alias pip=pip3
alias gs='git status'
alias gb='git branch --sort=-committerdate'
alias gg='cd $HOME/go/src'
alias ww='cd $HOME/workspace'
alias tag="git tag --sort=-creatordate"
alias diff="git diff | vim -"
alias branch="git branch --sort=-committerdate"
alias l="ls -ltrah"
# alias cpc="pbcopy"
alias cpc="tr -d '\n' | pbcopy"

gp() {
	 git add . && git commit -m "$1" && git push
}

gc(){
    git add . -v && git commit 

    # if [ ! -z "$1" ];then 
    #     # git add . -v && git commit -m "$1" -v 
    # else 
    #     printf "${RED}Commit message not valid${NC}\n"
    # fi 

}
listen(){
    sudo lsof -i -P | grep -i "listen"
}
parse_git_branch() {
    branch=$(git symbolic-ref --short HEAD 2> /dev/null)
    if [ ! -z $branch ];then
        git_status=$(git status --porcelain 2>/dev/null)
        if [ ! -z $git_status ];then 
            echo "[$branch ${GREEN}✚${YELLOW}]"
        else 
            echo "[$branch]"
        fi 
    fi
}
setopt PROMPT_SUBST
PROMPT='%{%F{blue}%}%9c%{%F{none}%} %{%F{yellow}%}$(parse_git_branch)%{%F{none}%} ❯ '

source $HOME/venv/dev/bin/activate
