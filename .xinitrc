xrdb -merge ~/.Xresources
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
xsetroot -solid black ;
exec dwm

