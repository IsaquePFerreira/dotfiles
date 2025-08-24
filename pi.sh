#!/bin/bash
# ppi.sh
#
# Faz a pós-instalação do Void Linux.
#

set -e # Sai em caso de erro

# Variáveis
USERNAME="$(logname)" # Pega o nome do usuário
SUCKLESS_DIR="$HOME/.config/suckless" # Diretório programas suckless
PACKAGES=(
"linux-headers"
"xorg-minimal"
"xf86-video-intel"
"xorg-input-drivers"
"base-devel"
"libX11-devel"
"libXft-devel"
"libXinerama-devel"
"lightdm"
"lightdm-gtk3-greeter"
"lightdm-gtk-greeter-settings"
"man-db"
"dbus"
"elogind"
"polkit"
"ufw"
"chromium"
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
"pkgconf-dev"
"python3-pip"
"gdb"
"openjdk"
) # Lista de pacotes

# Atualiza o sistema
sudo xbps-install -Syu

# Instala os pacotes necessários
sudo xbps-install -y ${PACKAGES[@]}

# Copia arquivos de configuração para seu locais apropriados
mkdir -p $HOME/.config
cp -r config/* $HOME/.config/

# Cria diretório de scripts
mkdir -p $HOME/.local/bin
cp -r bin/* $HOME/.local/bin/

# Copia arquivos da home
for f in bash_aliases gitconfig tmux.conf; do
	cp $f "$HOME/.${f##/}"
done

# Cria diretório do suckless
mkdir -p $SUCKLESS_DIR

# Builda programas suckless
for prog in dwm dmenu st dwmblocks slock; do
    PROG_PATH="$SUCKLESS_DIR/$prog"
    if [ ! -d "$PROG_PATH"]; then
        echo "Download $prog..."
        git clone "https://git.suckless.org/$prog" "$PROG_PATH"
        cd "$PROG_PATH"
        echo "Build $prog..."
        make
        sudo make clean install
    else
        echo "$prog is installed... pass.."
    fi
done

# Limpa pacotes residuais
sudo xbps-remove -oOy

# Reconfigura todos os pacotes
sudo xbps-reconfigure -fa

# Atualiza cache de fontes
fc-cache -fv

# Habilita firewall
sudo ufw enable

# Habilita serviços essenciais
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/polkit /var/service/
sudo ln -s /etc/sv/ufw /var/service/

# Remove ttys não usados
for tty in tty3 tty4 tty5 tty6; do
    sudo rm -f /var/service/agetty-$tty
done

# GRUB timeout
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=0/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg # Recria arquivo de configuração

# Reinicia o Sistema
sudo reboot
