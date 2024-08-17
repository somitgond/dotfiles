#
# ~/.profile
#
#[[ -f ~/.bashrc ]] && . ~/.bashrc
export ENV=$HOME/.kshrc
export BROWSER='firefox'
export TERM='st'
export TERMINAL='st'
if [ "$(tty)" == "/dev/tty1" ]; then 
    pgrep -x dwm || exec startx
fi
#startx
