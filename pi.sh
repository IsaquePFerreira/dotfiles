#!/bin/bash
# pi.sh
#
# Post install script.
#

dotfiles_dir="$PWD"
user_bin="$HOME/.local/bin"

create_symlink() { 
    if ! test $# -eq 2; then
        echo ERROR: usage: create_symlink target symlink
        exit 1
    fi

    target=$1
    symlink=$2

	# Make sure the symlink parent dir exists
    mkdir -p $(dirname $symlink)

    if test -L $symlink; then
        if test $(readlink $symlink) = $target; then
            echo $symlink is already done
        else
            echo $symlink is a symlink to an unknown file
        fi
    elif test -f $symlink; then
        echo $symlink is a normal file, skipping symlink creation
    elif test -d $symlink; then
        echo $symlink is a directory, skipping symlink creation
    else
        ln -s -v $target $symlink
    fi
}

paths="
    .bash_aliases
    .fehbg
    .tmux.conf
    .config/bspwm/bspwmrc
    .config/bspwm/sxhkdrc
    .config/bspwm/autostart
    .config/dunst/dunstrc
    .config/nvim/init.vim
    .config/picom/picom.conf
    .config/polybar/config.ini
    .config/polybar/launch.sh
"
echo Create symlinks...
for path_ in $paths; do
    create_symlink $dotfiles_dir/$path_ $HOME/$path_
done

echo Create user bin directory
if test -d $user_bin; then
    echo $user_bin already created
else
    mkdir -p -v $user_bin
fi

echo Install scripts...
for path_ in bin/*; do
    create_symlink $dotfiles_dir/$path_ $user_bin/$path_
done

echo Update system...
sudo apt --quiet --quiet update && sudo apt upgrade --quiet --quiet -y

echo Install extra packages...
sudo apt install --quiet --quiet -y suckless-tools docker.io git neovim tmux python3-venv

echo Remove orphaned packages and clear cache
sudo apt autoremove && sudo apt autoclean && sudo apt clean

read -p 'Would you like to restart?[yN] ' resp
if [ "${resp,,}" != 'y' ]; then
	exit 1
fi
sudo reboot
