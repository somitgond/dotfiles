# Statusbar loop
 slstatus 2> /dev/null &
# mapping capslock to escape key 
setxkbmap -option caps:swapescape -option terminate:ctrl_alt_bkspc -option shift:both_capslock -option shift:both_capslock_cancel &

#mapping printscreen key between ctrl_r and alt_r to super_l key
sleep 5 && xmodmap -e "keycode 107 = Super_L" && xmodmap -e "remove mod1 = Super_L" &
#xrandr --output eDP-1 --mode 1920x1080 --rate 60 &
#xsetroot -solid black &
xsetroot -solid "#708020" &

#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
#nm-applet &
xset r rate 250 60 & 
redshift -P -O 3000 &
#/usr/bin/xautolock -locker /usr/bin/slock -detectsleep -secure -time 10 &
#xfce4-screensaver 2> /dev/null &
