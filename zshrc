#export ZSH=~/.oh-my-zsh
#ZSH_THEME="zet"
#plugins=(brew git virtualenv virtualenvwrapper)
#source $ZSH/oh-my-zsh.sh

export LANG="zh_TW.UTF-8"
export LC_ALL="zh_TW.UTF-8"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source ~/ctf-tools/pwn

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias -s py=python

alias ida='wine ~/Documents/idaPro6.8/idaq.exe &'
alias ida64='wine ~/Documents/idaPro6.8/idaq64.exe &'

alias php70='brew link php70'
alias php55='brew unlink php70'
alias phps='php -S 0.0.0.0:9000'

alias nc='netcat'

function heap()
{
ltrace $1 |& ~/tools/villoc/villoc.py - /var/www/heap.html;
}

