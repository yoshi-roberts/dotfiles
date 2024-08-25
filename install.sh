#!/usr/bin/sh
sudo pacman -S unzip fzf exa bat stow \
	pamixer playerctl pavucontrol udiskie trash-cli lf \
	chafa foot waybar calcurse swaybg nwg-look python-httplib2 \
	firefox docker gdu bottom \
	ttf-jetbrains-mono-nerd noto-fonts-emoji

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../ && rm -rf paru

# AUR
paru -S tofi

systemctl enable --now docker.service
sudo usermod -aG docker $USER

# Wallpapers
git clone https://codeberg.org/Moncii/wallpapers.git ~/Pictures/wallpapers
