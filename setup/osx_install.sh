#!/bin/sh

# xcode
xcode-select --install
xcode-select -p

# homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# config proxychains-ng
# vim /usr/local/etc/proxychains.conf
# socks5  127.0.0.1 7000
brew install vim git tmux htop wget zsh bash python@2 \
wine \
cmake java \
coreutils

# programming
brew tap homebrew/homebrew-php
brew install php56 python 

# security 
brew install nmap sqlmap proxychains-ng netcat nikto
# binary tools 
brew install radare2

brew cask install android-platform-tools

brew cask install chrome firefox virtualbox visual-studio-code iterm2 spotify iina telegram-desktop evernote
