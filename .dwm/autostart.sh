# mapping printscreen key between ctrl_r and alt_r to super_l key
sleep 1 && xmodmap -e "keycode 107 = Super_L" && xmodmap -e "remove mod1 = Super_L" &

# Statusbar loop
slstatus 2> /dev/null &

# set wallpaper
# Random set a wallpaper
xwallpaper --zoom "$(ls ~/.wallpapers/* | shuf | head -1)" &

# mapping capslock to escape key 
#setxkbmap -option caps:swapescape -option shift:both_capslock -option shift:both_capslock_cancel &
setxkbmap -option shift:both_capslock -option shift:both_capslock_cancel &

#xrandr --output eDP-1 --mode 1920x1080 --rate 60 &

#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# start polkit session
# dbus update
#dbus-update-activation-environment --systemd --all

# policykit
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# gnome keyring
/usr/bin/gnome-keyring-daemon --daemonize --login --components=pkcs11,secrets,ssh 

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
brightnessctl s 5%;

# NetworkManager applet 
#nm-applet & 
