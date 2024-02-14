#
# ~/.bashrc
#
stty -ixon
HISTSIZE= HISTFILESIZE=
shopt -s autocd




# If not running interactively, don't do anything

[[ $- != *i* ]] && return
export PATH="$PATH:$HOME/.local/bin"

# Some alias
alias ls='ls -hN --color=auto --group-directories-first'
alias la='ls -alh --color=auto --group-directories-first'
alias c='xwallpaper --zoom "$(ls -d $HOME/.wallpapers/* | shuf -n 1)"'
alias ff="fastfetch"
alias nv="nvim"
alias v="vim"
alias sv="sudo vim"
alias open="xdg-open"
alias sc="flameshot gui"
alias grep='grep --color=auto'
alias lo='kill -9 -1'
alias sdn='shutdown -h now'
alias rst='reboot'
alias wigo='sudo systemctl start NetworkManager && nm-applet &'
alias p="sudo pacman "
alias SS="sudo systemctl"
alias mkd="mkdir -pv"
alias lock='slock -m "Locked at  $(date "+%a %d, %H:%M:%S")"'

#PS1='[\u@\h \W]\$ '
PS1="\[\033[1m\]\[\033[38;5;1m\][\[\033[38;5;3m\]\u\[\033[38;5;2m\]@\[\033[38;5;4m\]\h \[\033[38;5;5m\]\W\[\033[38;5;1m\]]\[\033[0m\] "

