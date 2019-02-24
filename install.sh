#!/bin/bash

# install - script que instala e configura o PopCorn Time
# Autor: Renato Tavares

clean
echo "Iniciando a instalação do Popcorn Time..."

# Instalando os softwares necessários
sudo apt update
sudo apt install libcanberra-gtk-module libgconf-2-4 wget -y

cd /tmp/
sudo rm Popcorn-Time-*
sudo wget https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz

sudo mkdir -p /opt/popcorntime
sudo tar Jxf /tmp/Popcorn-Time-* -C /opt/popcorntime

sudo ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time

# Ciando a configuração para o ícone
sudo echo "[Desktop Entry]" >> /usr/share/applications/popcorntime.desktop
sudo echo "Version = 1.0" >> /usr/share/applications/popcorntime.desktop
sudo echo "Type = Application" >> /usr/share/applications/popcorntime.desktop
sudo echo "Terminal = false" >> /usr/share/applications/popcorntime.desktop
sudo echo "Name = Popcorn Time" >> /usr/share/applications/popcorntime.desktop
sudo echo "Exec = /usr/bin/Popcorn-Time" >> /usr/share/applications/popcorntime.desktop
sudo echo "Icon = /opt/popcorntime/popcorn.png" >> /usr/share/applications/popcorntime.desktop
sudo echo "Categories = Application;" >> /usr/share/applications/popcorntime.desktop

# Busca o ícone novo
sudo wget -O /opt/popcorntime/popcorn.png https://upload.wikimedia.org/wikipedia/commons/d/df/Pctlogo.png

clean
echo "Instalação finalizada"
