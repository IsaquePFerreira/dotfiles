#!/bin/bash
# ppi.sh
#
# Faz a pós-instalação do Void Linux.
#

# Variáveis
# Artwork
URL_WALLPAPERS="https://github.com/IsaquePFerreira/wallpapers"
WALLPAPERS_FOLDER="$HOME/Pictures/wallpapers"
URL_FONTS="https://github.com/IsaquePFerreira/fonts"
FONTS_FOLDER="$HOME/.local/share/fonts"
# Pega o nome do usuário
USERNAME="$(logname)"
PACKAGES=(
"build-essential"
"chromium"
"curl"
"wget"
"docker.io"
"fzf"
"gimp"
"git"
"htop"
"inxi"
"lynx"
"w3m"
"ncdu"
"neofetch"
"neovim"
"tmux"
"virt-manager"
"lua5.2"
"php8.3"
"php8.3-mysql"
"sassc"
)

# Atualiza o sistema
sudo apt update && sudo apt upgrade -y

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Instala os pacotes necessários
sudo apt install -y ${PACKAGES[@]}

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Copia arquivos de configuração para seu locais apropriados
mkdir -p $HOME/.config
cp -r config/* $HOME/.config/

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

mkdir -p $HOME/.local/bin
cp -r bin/* $HOME/.local/bin/

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

for f in bash_aliases gitconfig tmux.conf; do
	cp $f "$HOME/.${f##/}"
done

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Baixa wallpapers
if [ ! -d "$WALLPAPERS_FOLDER" ]; then
    git clone --depth=1 "$URL_WALLPAPERS" "$WALLPAPERS_FOLDER"
fi

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Baixa fontes
if [ ! -d "$FONTS_FOLDER" ]; then
    git clone --depth=1 "$URL_FONTS" "$FONTS_FOLDER"
fi

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Atualiza cache das fontes
fc-cache -fv

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Limpa pacotes residuais
sudo apt autoremove -y && sudo apt autoclean && sudo apt clean

if [ "$?" != "0" ]; then
    echo "Deu ruim... Saindo..."
    exit 1
fi

# Reinicia o Sistema
sudo reboot
