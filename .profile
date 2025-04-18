# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# ~/.profile
#
#[[ -f ~/.bashrc ]] && . ~/.bashrc
#[[ -f ~/.kshrc ]] && . ~/.kshrc
#[[ -f ~/.mkshrc ]] && . ~/.mkshrc
#
export LANG=en_US.UTF-8
export BROWSER='firefox'
export ENV=~/.mkshrc
export TERMINAL='st'
#if [ "$(tty)" == "/dev/tty1" ]; then 
#    pgrep -x dwm || exec startx
#fi
#startx
