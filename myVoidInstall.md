# My void Installation Notes

- void linux iso  
- three partitions: boot (/boot/efi), root (/), home (/home)  
- dwm   
- dmenu  
- st  
- slstatus  
- slock  
- fonts:  
    a. noto-fonts-emoji  
    b. noto-fonts-cjk  
    c. noto-fonts-ttf  
    d. Meslo LG Nerd font: https://www.nerdfonts.com/font-downloads 
- common programs:
   a. firefox
   b. code-oss
   c. neovim
   d. google-chrome-stable (from xbps-src): For official uses, DRM 
   e. thunar (xfce4 packages)
   f. polkit-gnome ( /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 , on void:  /usr/libexec/polkit-gnome-authentication-agent-1) 
   g. unclutter
   h. dunst, notify-send
   i. xmodmap, setxkbmap, xsetroot, xet, xwallpaper, xcompmgr 
   j. sxhkd
   k. redshift
   l. dbus

## my EFIstub command
- ``` sudo efibootmgr -c -d /dev/sda -p 1 -L "Void (efistub)" -l /EFI/void/vmlinuz-6.6.43_1 -u "root=UUID=49a2438c-e97e-477d-a548-54c4e80f19fc rw initrd=/EFI/void/initramfs-6.6.43_1.img quiet splash loglevel=0 nowatchdog" ```
- copy /boot/vmlinuz and /boot/initramfs to /boot/efi/EFI/<name>/

# Optimizations
- check this out [this link](https://gist.github.com/rauldux/1c68290d26a6d0c931f17b0df72da673)
- edit /etc/rc.local to clear screen output

