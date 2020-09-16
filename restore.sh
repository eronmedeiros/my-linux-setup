#!/bin/bash

MY_DIR=$(pwd)

#--------------------------------------------------#
# MOVE DOTFILES
#--------------------------------------------------#

echo -e "[ + ] Movendo dotfiles \n"

cp ${MY_DIR}/dotfiles/.vimrc ${HOME}/

#--------------------------------------------------#
# UPDATE DISTRO
#--------------------------------------------------#

echo -e "[ + ] Atualizando e instalando pacotes \n"

sudo apt update && \
sudo apt upgrade -y && \
sudo apt autoremove && \
sudo apt install -y vim git dnsutils curl nmap

#--------------------------------------------------#
# SET INTERFACE, CURSOR AND ICONS THEME
#--------------------------------------------------#

# TODO - CHECAR SE EXISTE A PASTA .THEMES E .ICONS
# TEST - TESTAR SE AS CONFIGURAÇÕES ABAIXO ESTÃO CORRETAS

echo -e "[ + ] Baixando tema de interface \n"
git clone $'https://github.com/EliverLara/Nordic'

echo -e "[ + ] Instalando tema de interface \n"
mv ${MY_DIR}/Nordic/ ${HOME}/.themes/Nordic
gsettings set org.gnome.desktop.wm.preferences theme "Nordic"
gsettings set org.gnome.shell.extensions.user-theme name "Nordic"
gsettings set org.gnome.desktop.interface gtk-theme "Nordic"

echo -e "[ + ] Baixando tema de icones \n"
#https://www.gnome-look.org/s/Gnome/p/1279924/
git clone $'https://github.com/vinceliuice/Tela-icon-theme'

echo -e "[ + ] Instalando tema de icones \n"
mv ${MY_DIR}/Tela-icon-theme/ ${HOME}/.icons/Vimix-cursors
gsettings set org.gnome.desktop.interface icon-theme "Tela"

#echo -e "[ + ] Baixando tema de cursor \n"
#https://www.gnome-look.org/s/Gnome/p/1358330/
git clone $'https://github.com/vinceliuice/Vimix-cursors'

#echo -e "[ + ] Instalando tema de cursor \n"
mv ${MY_DIR}/Vimix-cursors/ ${HOME}/.icons/Vimix-cursors
gsettings set org.gnome.desktop.interface cursor-theme "Vimix-cursors"

#--------------------------------------------------#
# SET BACKGROUND AND SCREENSAVER IMAGE
#--------------------------------------------------#

mv ${MY_DIR}/Pictures/ ${HOME}/
#gsettings set org.gtk.settings.file-chooser date-format 'regular'
#gsettings set org.gtk.settings.file-chooser location-mode 'path-bar'
#gsettings set org.gtk.settings.file-chooser show-hidden true
#gsettings set org.gtk.settings.file-chooser show-size-column true
#gsettings set org.gtk.settings.file-chooser sidebar-width 176
#gsettings set org.gtk.settings.file-chooser sort-column 'name'
#gsettings set org.gtk.settings.file-chooser sort-directories-first false
#gsettings set org.gtk.settings.file-chooser sort-order 'ascending'
gsettings set org.gnome.desktop.background picture-uri 'file:///home/eron/Pictures/Simplicity_GNOME_FHD_Neon_Blue.png'
gsettings set org.gnome.desktop.background picture-options 'zoom'

gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/eron/Pictures/Simplicity_GNOME_FHD_Neon_Blue.png'
gsettings set org.gnome.desktop.screensaver picture-options 'zoom'

exit 0

