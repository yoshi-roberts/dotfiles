#!/usr/bin/sh
sudo pacman -S unzip stow pamixer playerctl pavucontrol udiskie trash-cli \
	chafa foot fzf exa bat waybar calcurse lf swaybg python-httplib2 ngw-look

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../ && rm -rf paru

# AUR
paru -S tofi brave-bin

