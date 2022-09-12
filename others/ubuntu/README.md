
### DNS set up ubuntu 18.04 
default : /etc/resolv.conf is a symlinc of /run/resolvconf/resolv.conf

target : /run/systemd/resolve/resolv.conf is a file maintained by systemd-resolved for compatibility with traditional Linux programs


### Python env prompt 
if [ -z "${VIRTUAL_ENV_DISABLE_PROMPT:-}" ] ; then
    _OLD_VIRTUAL_PS1="${PS1:-}"
    # PS1="(trunk) ${PS1:-}"
    PS1="\[\033[1;34m\](trunk)\[\033[00m\] ${PS1:-}"                
    export PS1
fi
