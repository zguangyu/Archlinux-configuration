# Created by newuser for 4.3.10
export PS1='$vcs_info_msg_0_'$'%{\e[36;1m%}%#%{\e[0m%}'
export XMODIFIERS="@im=ibus"
export XIM="ibus"
export LC_CTYPE=zh_CN.utf8
export XIM_PROGRAM="ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="ibus"
export QTDIR=/opt/qt
export LPDEST=HP
if [ -x /bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias grep='grep --color=always'
fi

alias less='less -R'
alias df='df -Th'
alias du='du -h'
alias free='free -m'
alias ll='ls -lha'
alias I='sudo pacman -Sy'
alias Ip='sudo powerpill -Sy'
alias U='sudo pacman -Syu'
alias Up='sudo powerpill -Syu'
alias S='pacman -Ss'
alias M='mkpkg'
alias C='sudo pacman -Scc'
alias L='pacman -Ql'
alias O='pacman -Qo'
alias P='pacman'
alias R='sudo pacman -Rsc'
source /etc/makepkg.conf

