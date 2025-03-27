#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
SCRIPTS_DIR="~/.scripts"

PATH="$PATH:${SCRIPTS_DIR}"

# Some alias
alias syu='sudo pacman -Syu'
alias ai='sudo pacman -S'
alias ssw='exec sway'
alias x='startx'
alias x4='startxfce4'
alias ls='eza --group-directories-first'
alias la='eza -a --group-directories-first'
alias cp='cp -i'
alias ff="fastfetch"
alias v="vi"
alias vim='nvim'
alias ping="ping -c 2"
alias ps="ps auxf"
alias mkdir="mkdir -p"
alias open="xdg-open"
alias grep='grep --color=auto'
alias lo='kill -9 -1'
alias mkd="mkdir -pv"
alias warmcolor=' redshift -P -O 3000' 
alias normcolor=' redshift -P -O 6500'
alias startpy='. ~/.local/python3/bin/activate'
alias startcp='nvim -S ~/cpp/cpp-config '
alias smci='sudo make clean install ; make clean '
#alias hi='fc -l'
alias c='clear'
alias lck='slock'
alias sudo='sudo '
alias cmtp='ssh somit@172.18.42.32'
alias cw='xwallpaper --zoom "$(ls ~/.wallpapers/* | shuf | head -1)"'
alias cm='pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# scripts
alias sdn="shutdown -h now"
alias rst="reboot"

#Some cool characters: λ, ∫, ∮, ➾, ▶, ▷, 🞂,＄
BLACK="\033[1;30m"
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PINK="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
NORMAL="\033[0;39m"
NORMAL_BOLD="\033[1;39m"

PS1='[\u@\h \W]\$ '
