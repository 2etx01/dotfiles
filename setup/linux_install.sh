#!/bin/sh


## ppa
sudo add-apt-repository ppa:jonathonf/vim

# install tmux
sudo apt update
sudo apt install -y git
sudo apt install -y automake build-essential pkg-config libevent-dev libncurses5-dev 
rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
sh autogen.sh
./configure && make
sudo make install
rm -fr /tmp/tmux


apt-get install ttf-mscorefonts-installer font-noto