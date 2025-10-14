xrdb -merge ~/.Xresources ;

eval $(gnome-keyring-daemon --start) &

# set keyboard press frequency and delay time
xset r rate 250 60 & 

# make display warmer
#redshift -P -O 3000 &

# clipboard
xclip &

# start pipewire
#pipewire 2>/dev/null &

# start dunst
dunst &

# hide mouse cursor when not in use
unclutter &

# setting brightness of screen
#brightnessctl s 10% &

# NetworkManager applet 
#nm-applet & 

#map capslock to escape key
setxkbmap -option caps:escape &

# Random set a wallpaper
xwallpaper --zoom "$(ls ~/.wallpapers/* | shuf | head -1)" &

# start slstatus
slstatus 2> /dev/null &

exec dwm 
