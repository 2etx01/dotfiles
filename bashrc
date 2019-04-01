# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
export TERM=xterm-256color

if [[ -n "$TMUX" ]]; then
    bind '"\e[1~":"\eOH"'
    bind '"\e[4~":"\eOF"'
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=vim
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.dotfiles/tools"
 

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias grep='grep --color=auto'
alias strace="strace -ixv"
alias ltrace="ltrace -iC"
alias objdump="objdump -M intel"
alias gdb="gdb -q"
alias vi='vim --noplugin'

alias g='git'
alias gd='git diff'
alias ga='git add'
alias gcm='git commit --message'
alias gp='git push'
alias gl='git pull'
alias gpc='git push --set-upstream origin "$(git_current_branch 2> /dev/null)"'
alias gpp='git pull origin "$(git_current_branch 2> /dev/null)" && git push origin "$(git_current_branch 2> /dev/null)"'
alias gc='git checkout'
alias gb='git branch'
alias gs='git status'

alias pys='python -m SimpleHTTPServer'
alias phps='php -S 0.0.0.0:9000'

alias nc='netcat'
alias shutdown='shutdown -h now'
alias reboot='shutdown -r now'
alias freemem='echo 1 > /proc/sys/vm/drop_caches'
alias ip='curl ip.zet.tw'

if [ "$(uname)" == "Darwin" ]; then
    export LSCOLORS="exfxcxdxbxGxDxabagacad"
    alias ls="ls -G"
    alias php70='brew link php70'
    alias php55='brew link php55'
    alias php56='brew link php56'
    alias brewup="brew upgrade && brew cleanup"
fi

[ -f ~/.ctf-tools/pwn ] && . ~/.ctf-tools/pwn

x(){
    chmod +x $1
}

killport(){
    kill -9 `lsof -t -i:$1`
}

#Docker
da(){
    docker exec -it $1 zsh
}


