# Statusbar loop
slstatus 2> /dev/null &

# set wallpaper
xwallpaper --zoom ~/.local/wall &

# mapping capslock to escape key 
setxkbmap -option caps:swapescape -option shift:both_capslock -option shift:both_capslock_cancel &

# mapping printscreen key between ctrl_r and alt_r to super_l key
sleep 5 && xmodmap -e "keycode 107 = Super_L" && xmodmap -e "remove mod1 = Super_L" &

#xrandr --output eDP-1 --mode 1920x1080 --rate 60 &

#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# start polkit session
/usr/libexec/polkit-gnome-authentication-agent-1 &
#/usr/libexec/xfce-polkit &

# set keyboard press frequency and delay time
xset r rate 250 60 & 

# make display warmer
redshift -P -O 3000 &

# start pipewire
pipewire 2>/dev/null &

# start dunst
dunst &

# hide mouse cursor when not in use
unclutter &

# setting brightness of screen
brightnessctl s 5%;

# NetworkManager applet 
#nm-applet & 
