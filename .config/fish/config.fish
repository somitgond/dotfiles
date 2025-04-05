if status is-interactive

alias syu 'sudo pacman -Syu'
alias ryu 'sudo pacman -Sc'
alias p 'sudo pacman'
alias ssw 'exec sway'
alias xr 'exec river'
alias x 'startx'
alias x4 'startxfce4'
alias ls 'eza --group-directories-first'
alias la 'eza -a --group-directories-first'
alias cp 'cp -i'
alias ff "fastfetch"
alias v "nvim"
alias sv "sudo nvim"
alias vim 'nvim'
alias ping "ping -c 2"
alias ps "ps auxf"
alias mkdir "mkdir -p"
alias open "xdg-open"
alias grep 'grep --color auto'
alias lo 'kill -9 -1'
alias mkd "mkdir -pv"
alias warmcolor ' redshift -P -O 3000' 
alias normcolor ' redshift -P -O 6500'
alias startpy '. ~/.local/python3/bin/activate'
alias startcp 'nvim -S ~/cpp/cpp-config '
alias smci 'sudo make clean install ; make clean '
alias c 'clear'
alias lck 'slock'
alias sudo 'sudo '
alias cmtp 'ssh somit@172.18.42.32'
alias cw 'xwallpaper --zoom "$(ls ~/.wallpapers/* | shuf | head -1)"'
alias cm 'pdflatex main.tex && biber main && pdflatex main.tex && pdflatex main.tex'
alias gst 'git status'
alias SS 'sudo systemctl'
alias gpom 'git push origin main'
alias s8 'cd ~/Documents/sem8/; ls'


# Change directory aliases
alias home 'cd ~'
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# scripts
alias sdn "shutdown -h now"
alias rst "reboot"
end
