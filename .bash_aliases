alias pacman='pacman-color'
alias less='less -R'
alias df='df -Th'
alias du='du -h'
alias free='free -m'
alias U='yaourt -Syu'
alias S='pacman -Ss'
alias Y='yaourt'
alias M='makepkg -s'
alias L='pacman -Ql'
alias O='pacman -Qo'
alias P='pacman'
alias I='sudo pacman -U'
alias R='sudo pacman -Rsc'

if [ -x /bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
