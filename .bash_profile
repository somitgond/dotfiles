#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export BROWSER='firefox'
export TERM='alacritty'
export TERMINAL='alacritty'
if [ "$(tty)" == "/dev/tty1" ]; then 
    pgrep -x dwm || exec startx
fi
#startx
