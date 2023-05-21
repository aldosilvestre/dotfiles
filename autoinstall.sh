#!/bin/bash

green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

function main(){
    clear; echo -e "${red}[!] ${yellow}Bienvenid@ al programa de instalacion de mis dots personales."
    sleep 1
    # Apartados

    echo -e "\n${green}1 - ${blue}Instalar paquetes."

    echo -e "\n${green}2 - ${blue}Intalar paquetes aur."

    echo -e "\n${green}3 - ${blue}Configurar."

    echo -e "\n${green}4 - ${blue}Ejecutar todo."

    echo -e "${purple}"; read -p "-> " opcion

    if [ "$opcion" == "1" ]; then
        packages
        fi

    if [ "$opcion" == "2" ]; then
        build
        fi

    if [ "$opcion" == "3" ]; then
        configuration
        fi

    if [ "$opcion" == "4" ]; then
        packages
        installaur
        configuration
        fi
}

function packages(){

    clear; echo -e "\n${green}[+] - ${blue}Instalando dependencias..."

    sudo pacman -Syyu \
                  bspwm \
                  sxhkd \
                  dmenu \
                  lsd \
                  bat \
                  ripgrep \
                  xorg \
                  neovim \
                  feh \
                  picom \
                  rofi \
                  kitty \
                  base-devel \
                  make \
                  neofetch \
                  git \
                  alsa-utils \
                  volumeicon \
                  network-manager-applet \
                  lxappearance \
                  nemo \
                  nitrogen \
                  --noconfirm

    mkdir /home/$USER/.config 2>/dev/null

    git clone https://aur.archlinux.org/paru.git 2>/dev/null

    chmod 777 paru/ 2>/dev/null

    cd paru/ 2>/dev/null

    makepkg -si --noconfirm 2>/dev/null

    cd .. 2>/dev/null

    sudo rm -rf paru/ 2>/dev/null

}

function installaur(){
    paru -Sy polybar nerd-fonts-complete indicator-sound-switcher --noconfirm
}

function configuration(){

}

if [ "$(id -u)" == "0" ]; then
    echo -e "\n${red}[!] No hay que ser root para ejecutar la herramienta${end}"
	echo
	exit 1
else
	main
fi
