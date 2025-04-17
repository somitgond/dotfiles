# zsh config
# The following lines were added by compinstall

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# /etc instead of cd /etc 
setopt autocd

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
#
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH="$PATH:$HOME/.local/bin:$HOME/.scripts"

# Some alias
alias syu='sudo pacman -Syu'
alias ryu='sudo pacman -Sc'
alias p='sudo pacman'
alias ssw='exec sway'
alias xr='exec river'
alias x='startx'
alias x4='startxfce4'
alias ls='eza --group-directories-first'
alias la='eza -a --group-directories-first'
alias cp='cp -i'
alias ff="fastfetch"
alias v="nvim"
alias sv="sudo nvim"
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
alias c='clear'
alias sudo='sudo '
alias cmtp='ssh somit@172.18.42.32'
alias cm='pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex'
alias gst='git status'
alias SS='sudo systemctl'
alias gpom='git push origin main'
alias s8='cd ~/Documents/sem8/; ls'

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

# git
#PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
PROMPT='%F{blue}%B%~%b%f %# '

source <(fzf --zsh)

# plugins
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

#eval "$(starship init zsh)"

