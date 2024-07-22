#
# ~/.bashrc
#
stty -ixon
HISTSIZE= HISTFILESIZE=
shopt -s autocd

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

export PATH="$PATH:$HOME/.local/bin:/usr/sbin/"

# Some alias
alias wigo='sudo sv start NetworkManager'
alias ls='ls -hN --color=auto --group-directories-first'
alias la='ls -alh --color=auto --group-directories-first'
alias src='cd ~/.local/dotfiles/ && ls '
alias ff="fastfetch"
alias v="nvim"
alias open="xdg-open"
alias sc="flameshot gui"
alias grep='grep --color=auto'
alias lo='kill -9 -1'
alias sdn='shutdown -h now'
alias rst='reboot'
alias mkd="mkdir -pv"
alias lock='slock' 
alias warmcolor=' redshift -P -O 3000' 
alias normcolor=' redshift -P -O 6500'
alias updot='cp -r ~/.bashrc ~/.xinitrc ~/.xprofile ~/.Xresources ~/.vimrc ~/.bash_profile ~/.dwm/ ~/.config/nvim ~/github/dotfiles/' 
alias sudo='sudo '
alias code='code-oss'
alias startpy='source .local/python3/bin/activate'

alias startcp='nvim -S ~/cpp/cpp-config.vim '

#PS1='[\u@\h \W]\$ '
PS1="\[\033[1m\]\[\033[38;5;1m\][\[\033[38;5;3m\]\u\[\033[38;5;2m\]@\[\033[38;5;4m\]\h \[\033[38;5;5m\]\W\[\033[38;5;1m\]]\[\033[0m\] "

