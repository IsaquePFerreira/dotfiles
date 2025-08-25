#!/bin/bash
# pi.sh
#
# Faz a pós-instalação do Void Linux.
#

set -e # Sai em caso de erro

# Variáveis
PACKAGES=(
"linux-headers"
"xorg-minimal"
"xf86-video-intel"
"xorg-input-drivers"
"xprop"
"base-devel"
"lightdm"
"lightdm-gtk3-greeter"
"lightdm-gtk-greeter-settings"
"i3"
"i3lock-color"
"dmenu"
"xdg-user-dirs"
"xdg-utils"
"man-db"
"dbus"
"elogind"
"polkit"
"ufw"
"firefox"
"chromium"
"thunderbird"
"curl"
"wget"
"docker"
"fzf"
"gimp"
"ffmpeg"
"git"
"htop"
"inxi"
"lynx"
"w3m"
"ncdu"
"feh"
"mpv"
"mupdf"
"ranger"
"cmatrix"
"sakura"
"bash-completion"
"flameshot"
"alsa-utils"
"cups"
"cups-pdf"
"bluez"
"bluez-alsa"
"gvfs"
"gvfs-mtp"
"android-tools"
"noto-fonts-emoji"
"noto-fonts-cjk"
"terminus-font"
"font-inconsolata-otf"
"gnome-themes-extra"
"papirus-icon-theme"
"papirus-folders"
"neofetch"
"neovim"
"tmux"
"virt-manager"
"lua"
"php8.3"
"php8.3-mysql"
"sassc"
"cmake"
"ninja"
"meson"
"ImageMagick"
"clang"
"pkgconf-devel"
"python3-pip"
"gdb"
"openjdk"
) # Lista de pacotes

# Atualiza o sistema
sudo xbps-install -Syu

# Instala os pacotes necessários
sudo xbps-install -y ${PACKAGES[@]}

# Copia arquivos de configuração
mkdir -p $HOME/.config
cp -r config/* $HOME/.config/

# Copia scripts
mkdir -p $HOME/.local/bin
cp -r bin/* $HOME/.local/bin/

# Copia arquivos de configuração do teclado e touchpad
sudo mkdir -p /etc/X11/xorg.conf.d
sudo cp -r xorg.conf.d/* /etc/X11/xorg.conf.d/

# Copia arquivos da home
for f in bash_aliases tmux.conf; do
	cp $f "$HOME/.${f##/}"
done

# Limpa pacotes residuais
sudo xbps-remove -oOy

# Reconfigura todos os pacotes
sudo xbps-reconfigure -fa

# Atualiza cache de fontes
fc-cache -fv

# Cria diretórios do usuário
xdg-user-dirs-update

# Habilita firewall
sudo ufw enable

# Habilita serviços essenciais
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/polkitd /var/service/
sudo ln -s /etc/sv/ufw /var/service/
sudo ln -s /etc/sv/lightdm /var/service/

# Remove ttys não usados
for tty in tty3 tty4 tty5 tty6; do
    sudo rm -f /var/service/agetty-$tty
done

# GRUB timeout
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg # Recria arquivo de configuração

# Reinicia o Sistema
sudo reboot
