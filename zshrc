setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable bzr git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' formats ' - %b%c%u'
zstyle ':vcs_info:*' actionformats " - [%b%c%u|%F{cyan}%a%f]"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b|%F{cyan}%r%f'
zstyle ':vcs_info:git*+set-message:*' hooks git_status
precmd () {
    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    hook_com[unstaged]='%F{red}●%f'
    fi

    vcs_info
}
PROMPT='%F{cyan}%n@%m%f %F{green}%~%f # '
RPROMPT='${vcs_info_msg_0_}'


# history
export HISTSIZE=1000
export SAVEHIST=1000
setopt INC_APPEND_HISTORY #以附加方式寫入歷史紀錄
setopt HIST_IGNORE_DUPS #如果連續命令相同,只留一
limit coredumpsize 0 #core dump

# completion
autoload -U compinit
compinit
setopt correct #自動校正
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'  #大小寫修正
zstyle ':completion:*:*:*:*:*' menu select  #開啟補齊select顏色



#Colors
 # Define colors for BSD ls.
export LSCOLORS='exfxcxdxbxGxDxabagacad'
 # Define colors for the completion system.
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
if ls --color -d . &>/dev/null 2>&1
then
    # Linux Style
    alias ls='ls --color=tty'
else
    # BSD Style
    alias ls='ls -G'
fi



export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias -s py=python

alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'

alias gcm='git commit --message'
alias gp='git push'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gpp='git pull origin "$(git-branch-current 2> /dev/null)" && git push origin "$(git-branch-current 2> /dev/null)"'

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

