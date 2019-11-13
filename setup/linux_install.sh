#!/bin/sh

## ppa
#sudo add-apt-repository ppa:jonathonf/vim

# install tmux
sudo apt update
sudo apt install -y git
sudo apt install -y automake build-essential pkg-config libevent-dev libncurses5-dev 
rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
git checkout 2.4
sh autogen.sh
./configure && make
sudo make install
rm -fr /tmp/tmux

sudo apt install vim htop zsh man wget python-minimal python-pip  python3-pip 

pip3 install --user pipenv

## install docker
#sudo apt install docker.io
#rm -f /etc/localtime
#ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime

## font
#apt-get install ttf-mscorefonts-installer font-noto
