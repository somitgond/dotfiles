# Arch Installation Process 
Work In Progress  
## Preparation:
- download arch linux iso from [arch ISO](https://archlinux.org/download)
- make a bootable drive
- change boot menu of system, so that it boots from usb


## Installation Steps:
 1. Check network connection   
 		``` ping 1.1.1.1 ```
 2. partition the disk in this format:  
	steps to follow:  
	- Run command ``` fdisk -l ```, see the drive you want to install arch linux in  
	- ``` fdisk /dev/sda ```, it will select that drive  
		- delete all the existing partitions in the drive   
		- Create new MBR partition type
		- Create these partitions:  
			- boot : 1G, EFI partition type, toggle boot flag
			- root  : 50G, Linux file system
			- home 	: all of rest, Linux File system
3. Format the drives:
	- ``` mkfs.ext4 /dev/root_partition ``` same for home_partition
	- ``` mkfs.fat -F 32 /dev/efi_partition ``` for efi partition
4. mount the filesystems:
	- ``` mount /dev/root_partition /mnt ```
	- ``` mount --mkdir /dev/home_partition /mnt/home ```
	- ``` mount --mkdir /dev/efi_parition /mnt/boot/efi ```
5. Install the system:  
	- ``` pacstrap -K /mnt base base-devel linux-lts linux-firmware networkmanager firefox xorg vim git sudo xdg-user-dirs  iptables```
	- Alternatively add ``` intel-ucode ``` or ``` amd-ucode ```
 
6. configuring the system
	-- ``` genfstab -U /mnt >> /mnt/etc/fstab ```
	-  ``` arch-chroot /mnt ```
	- ``` ln -sf /usr/share/zoneinfo/Region/City /etc/localtime ```
	- Localization:
		- Edit /etc/locale.gen and uncomment ```en_US.UTF-8 UTF-8``` and other needed locales
		- ``` locale-gen ```
		- create locale.conf ``` vim /etc/locale.conf ``` and add the content ``` LANG=en_US.UTF-8```
7. Network configuration:
	- ``` vim /etc/hostname ```
8. Installing Packages:
	- Desktop Environment: ``` pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter lightmd-gtk-gretter-settings ```
	- Audio: ``` pacman -S pulseaudio pulseaudio-alsa pulseaudio equalizer pulseaudio-jack pamixer ```
	- video: ``` pacman -S vlc ```
	- ide: ``` pacman -S vscode```
	- fonts: ``` pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-ubuntu-font-family ttf-anonymous-pro ttf-inconsolata ttf-jerbrains-mono ```
	- Utilities: ``` pacman -S flameshot helix xwallpaper xcompmgr xrandr redshift tlp xf86-input-synaptics ```
	- AUR: install yay, and google-chrome


8. User management:
	- add root password ``` passwd ```
	- add user:
		- ``` useradd -m -G sudo,video,audio <username>```
		- ``` passwd <username> ```


9. Installing bootloader:
	- GRUB:
		- ``` pacman -S grub efibootmgr```
		- ``` grub-install /dev/<diskName>```
		- ``` grub-mkconfig -o /boot/grub/grub.cfg ```
	- syslinux

10. Exit and Reboot:
	- ``` systemctl enable NetworkManager```
	- type ``` exit ``` or Ctrl-d
	- unmount all the partitions:
		- ``` umount -R /mnt ```
	- reboot, ``` reboot```



# Others
## Night light
- redshift ``` redshift -P -O <colorTemperature> ``` low_temp: red, high_temp: blue, between 0 to 25k
## Competitive setup 
-for sublime text:  
	- create ``` inputf.in``` and ```outputf.in``` in a folder  
	- ``` {
			"cmd" : ["g++ -std=c++14 $file_name -o $file_base_name && timeout 4s ./$file_base_name<inputf.in>outputf.in"], 
			"selector" : "source.c",
			"shell": true,
			"working_dir" : "$file_path"
			} ```
## No /dev/mixer in device 
- load module ``` snd-mixer-oss ``` in the kernel

## Touchpad
- create ``` /etc/X11/xorg.conf.d/70-synaptics.conf ```  
add the content 
```
Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
                Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "30"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
EndSection
```
