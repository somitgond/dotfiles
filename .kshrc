# ~/.kshrc

stty -ixon
HISTFILE="$HOME/.ksh_history"
#HISTSIZE=HISTFILESIZE=500

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variabls
export PATH="$PATH:$HOME/.local/bin:/usr/sbin/"
export EDITOR=nvim
export VISUAL=nvim
set -o vi

# Some alias
alias wigo='sudo sv start NetworkManager ; nm-applet &'
alias ls='eza --group-directories-first'
alias l='eza -F --group-directories-first'
alias cp='cp -i'
alias la='eza -al --group-directories-first'
alias ll='eza -1'
alias src='cd ~/.local/dotfiles/ && ls '
alias ff="fastfetch"
alias v="nvim"
alias svi="sudo nvim"
alias vim='nvim'
alias cls="clear"
alias ping="ping -c 3"
alias ps="ps auxf"
alias mkdir="mkdir -p"
alias open="xdg-open"
alias grep='grep --color=auto'
alias lo='kill -9 -1'
alias sdn='sudo shutdown -h now'
alias rst='sudo reboot'
alias mkd="mkdir -pv"
alias lock='slock' 
alias warmcolor=' redshift -P -O 3000' 
alias normcolor=' redshift -P -O 6500'
alias sudo='sudo '
alias code='code-oss'
alias startpy='. ~/.local/python3/bin/activate'
alias startcp='nvim -S ~/cpp/cpp-config.vim '
alias smci='sudo make clean install ; make clean '
alias burpsuite='~/.local/BurpSuiteCommunity/BurpSuiteCommunity'
alias s7='cd ~/Documents/sem7/; ls'
alias mtp='cd ~/Documents/sem7/MTP; ls'
alias rm='trash -v'
alias hi='fc -l'
alias c='clear'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

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
PS1="$RED[$PINK\W$RED]$GREENλ$NORMAL "

# set up fzf
export FZF_DEFAULT_OPTS=' --color=fg:#ebdbb2,bg:#282828,hl:#b16286 --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f'

eval "$(zoxide init posix --hook prompt)"
