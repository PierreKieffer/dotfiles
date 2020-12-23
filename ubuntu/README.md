
### DNS set up ubuntu 18.04 
default : /etc/resolv.conf is a symlinc of /run/resolvconf/resolv.conf

target : /run/systemd/resolve/resolv.conf is a file maintained by systemd-resolved for compatibility with traditional Linux programs
