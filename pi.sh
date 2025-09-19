#!/bin/bash
# pi.sh
#
# Faz a pós-instalação do Void Linux.
#

set -e # Sai em caso de erro

# Variáveis
PACKAGES=(
"build-essential"
"i3"
"i3status"
"suckless-tools"
"man-db"
"curl"
"wget"
"docker"
"fzf"
"gimp"
"ffmpeg"
"git"
"btop"
"inxi"
"lynx"
"ncdu"
"mpv"
"cmus"
"sxiv"
"mupdf"
"ranger"
"cmatrix"
"xterm"
"alsa-utils"
"neovim"
"tmux"
"virt-manager"
"qemu-kvm"
"php8.2"
"php8.2-mysql"
"sassc"
"imagemagick"
"python3-pip"
"python3-venv"
"gdb"
) # Lista de pacotes

# Atualiza o sistema
sudo apt update && sudo apt upgrade -y

# Instala os pacotes necessários
sudo apt install -y ${PACKAGES[@]}

# Copia arquivos de configuração
mkdir -p $HOME/.config
cp -r config/* $HOME/.config/

# Copia scripts
mkdir -p $HOME/.local/bin
cp -r bin/* $HOME/.local/bin/

# Copia arquivos da home
for f in bash_aliases tmux.conf; do
	cp $f "$HOME/.${f##/}"
done

# Limpa pacotes residuais
sudo apt autoremove && sudo apt autoclean && sudo apt clean

# GRUB timeout
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg # Recria arquivo de configuração

# Reinicia o Sistema
read -p 'Deseja reiniciar?[sN] ' resp
if [ "${resp,,}" != 's' ]; then
	exit 1
fi
sudo reboot
