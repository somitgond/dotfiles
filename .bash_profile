#
# ~/.bash_profile
#
#setxkbmap -option "caps:swapescape" ;
[[ -f ~/.bashrc ]] && . ~/.bashrc
export BROWSER='firefox'
setxkbmap -option "caps:swapescape"&
export TERM='st'
export TERMINAL='st'
if [ "$(tty)" == "/dev/tty1" ]; then 
    pgrep -x dwm || exec startx
fi
#startx
