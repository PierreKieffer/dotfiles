#!/bin/bash 

sudo apt update \
	&& sudo apt install -y vim \
	&& sudo apt install -y git \
	&& sudo apt install -y zip \
	&& sudo apt install -y unzip \
	&& sudo apt install -y curl \
	&& sudo apt install -y wget \
	&& sudo apt install -y make \
	&& sudo apt install -y tig \
	&& sudo apt install -y tree \
	&& sudo apt install -y postgresql-client \
	&& sudo apt install -y  mongodb-clients \
	&& sudo apt install -y  vifm \
# && sudo apt install -y software-properties-common


# java 
sudo apt-get install -y openjdk-8-jdk
echo 'JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> $HOME/.bashrc

# scala 
sudo apt-get remove scala-library scala
sudo wget www.scala-lang.org/files/archive/scala-2.11.8.deb
sudo dpkg -i scala-2.11.8.deb

# spark 
wget https://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
tar -xvf spark-2.4.4-bin-hadoop2.7.tgz
sudo mv spark-2.4.4-bin-hadoop2.7 /usr/local/spark
echo 'SPARK_HOME=/usr/local/spark' >> $HOME/.bashrc
rm spark-2.4.4-bin-hadoop2.7.tgz

# go 
wget https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.16.7.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
echo 'export GOROOT=/usr/local/go' >> $HOME/.bashrc
echo 'export GOPATH=/home/$USER/go' >> $HOME/.bashrc
rm go1.16.7.linux-amd64.tar.gz

# sbt 
wget https://github.com/sbt/sbt/releases/download/v1.3.7/sbt-1.3.7.zip
mv sbt-1.3.7.zip /home/$USER
unzip /home/$USER/sbt-1.3.7.zip -d /home/$USER
rm /home/$USER/sbt-1.3.7.zip
echo 'export PATH=$PATH:/home/$USER/sbt/bin' >> /home/$USER/.bashrc

# python 
sudo apt install -y python3-pip
sudo apt install -y python3-venv
echo "alias pip='pip3'" >> $HOME/.bashrc
echo "alias python='python3'" >> $HOME/.bashrc


# docker 
sudo apt-get install -y apt-transport-https \
	&& sudo apt-get install -y ca-certificates \
	&& sudo apt-get install -y gnupg-agent \
	&& sudo apt-get install -y software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose
sudo gpasswd -a $USER docker

# k8s 
sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# bashrc 
echo "alias :t='tree'" >> $HOME/.bashrc
echo "alias vimt='vim -c NERDTreeToggle'" >> $HOME/.bashrc
echo "alias f='fg'" >> $HOME/.bashrc
echo "alias j='jobs'" >> $HOME/.bashrc
echo "alias vf='vifm . . -c view'" >> $HOME/.bashrc
echo "alias v='vim'" >> $HOME/.bashrc

echo "alias gs='git status'" >> $HOME/.bashrc
echo "alias gb='git branch'" >> $HOME/.bashrc
echo "alias gch='git checkout'" >> $HOME/.bashrc
echo "alias gsh='git stash'" >> $HOME/.bashrc
echo 'gp() {
        git add . && git commit -m "$1" && git push 
}' >> $HOME/.bashrc
echo 'gc() {
	git add . && git commit -m "$1"
}' >> $HOME/.bashrc
echo 'vg(){
	grep -rn "$1" -e "$2" | vim - "+:set hlsearch | /$2"
}' >> $HOME/.bashrc



# prompt
# PS1="${debian_chroot:+($debian_chroot)}> \[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\]\$(__git_ps1 ' [%s] ')\[\033[00m\]\$ "


# if [ "$color_prompt" = yes ]; then
# PS1="${debian_chroot:+($debian_chroot)}> \[\033[01;34m\]\w\[\033[00m\]\[\033[01;33m\]\$(__git_ps1 ' [%s] ')\[\033[00m\]\$ "
# else
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt

# case "$TERM" in
# xterm*|rxvt*)
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\$(__git_ps1 ' [%s] ')\a\]$PS1"
# ;;
# *)
# ;;
# esac

