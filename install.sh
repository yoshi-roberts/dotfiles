#!/usr/bin/sh
sudo pacman -S zip unzip fzf exa bat stow \
	pamixer playerctl pavucontrol udiskie trash-cli lf \
	chafa foot waybar hyprpaper calcurse python-httplib2 \
	thermald firefox docker gdu bottom audacious \
	thunar thunar-archive-plugin engrampa \
	adw-gtk-theme ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji \
	hyprlock hypridle rofi-wayland nwg-look

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

# AUR
yay -S swayosd-git hyprshot qimgv

# Start Services.
systemctl enable --now swayosd-libinput-backend.service
systemctl enable --now thermald.service

systemctl enable --now docker.service
sudo usermod -aG docker $USER

# Wallpapers
git clone https://codeberg.org/moncii/wallpapers.git ~/Pictures/wallpapers

# Exit message.
echo 
echo "==== Finished ===="
echo "You should reboot."
echo
