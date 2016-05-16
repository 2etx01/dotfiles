setopt prompt_subst # enable command substition in prompt
autoload -Uz vcs_info

function +vi-git_status {
  # Check for untracked files or updated submodules since vcs_info does not.
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    hook_com[unstaged]='%F{red}●%f'
  fi
}
zstyle ':vcs_info:*' enable bzr git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' formats '  %b%c%u'
zstyle ':vcs_info:*' actionformats " - [%b%c%u|%F{cyan}%a%f]"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b|%F{cyan}%r%f'
zstyle ':vcs_info:git*+set-message:*' hooks git_status
zstyle ':completion:*' use-ip true

ASYNC_PROC=0
ASYNC_DATA="${TMPPREFIX}-prompt_sorin_data"
function precmd() {

    function async() {
        vcs_info
        # save to temp file
        printf "%s" "${vcs_info_msg_0_}" > $ASYNC_DATA
        # signal parent
        kill -s USR1 $$
    }
    # do not clear RPROMPT, let it persist
    # kill child if necessary
    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi
    # start background computation
    async &!
    ASYNC_PROC=$!
}
function TRAPUSR1() {
    # read from temp file
    RPROMPT="$(cat $ASYNC_DATA)"
    # reset proc number
    ASYNC_PROC=0
    # redisplay
    zle && zle reset-prompt
}

PROMPT='%F{cyan}%n@%m%f %F{green}%~%f # '
RPROMPT=''


# history
HISTFILE=$HOME/.zsh_history
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

alias grep='grep --color'
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias -s py=python

alias grep='grep --color'
alias -g G='| grep --color'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'


alias git_current_branch='git rev-parse --abbrev-ref HEAD'
alias g='git'
alias gd='git diff'
alias ga='git add'
alias gcm='git commit --message'
alias gp='git push'
alias gl='git pull'
alias gpc='git push --set-upstream origin "$(git_current_branch 2> /dev/null)"'
alias gpp='git pull origin "$(git_current_branch 2> /dev/null)" && git push origin "$(git_current_branch 2> /dev/null)"'

if [ `uname` = "Darwin" ]; then
    alias ida='wine ~/Documents/idaPro6.8/idaq.exe  >> /dev/null 2>&1 &'
    alias ida64='wine ~/Documents/idaPro6.8/idaq64.exe  >> /dev/null 2>&1 &'

    alias php70='brew unlink php70 && brew link php70'
    alias php55='brew unlink php55 && brew link php55'
    alias php56='brew unlink php56 && brew link php56'
    alias phps='php -S 0.0.0.0:9000'
fi

if [ -d ~/ctf-tools ]; then
    source ~/ctf-tools/pwn
fi

alias nc='netcat'
alias shutdown='shutdown -h now'
alias reboot='shutdown -r now'

#Docker
function da()
{
    docker exec -it $1 bash
}
