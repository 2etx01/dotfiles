#!/usr/bin/env bash
ln -fs `pwd`/vimrc    "${HOME}/.vimrc"
ln -fs `pwd`/tmux.conf    "${HOME}/.tmux.conf"
ln -fs `pwd`/gdbinit    "${HOME}/.gdbinit"
ln -fs `pwd`/gitconfig    "${HOME}/.gitconfig"
ln -fs `pwd`/zshrc    "${HOME}/.zshrc"
ln -fs `pwd`/vim "${HOME}/.vim"

if [ ! -d "${ZDOTDIR:-$HOME}/.oh-my-zsh" ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git "${HOME}/.oh-my-zsh"
fi
ln -fs `pwd`/zet.zsh-theme    "${HOME}/.oh-my-zsh/themes/zet.zsh-theme"

if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi
ln -fs `pwd`/zpreztorc   "${HOME}/.zpreztorc"
ln -fs `pwd`/prompt_zet_setup    "${HOME}/.zprezto/modules/prompt/functions/prompt_zet_setup"
