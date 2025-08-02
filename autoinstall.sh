#!/bin/bash
echo "WELCOME TO PEEPS' DEBIAN SETUP WIZARD! JUST SIT BACK AND RELAX WHILE THIS THING OF OURS DOES ITS THING."

echo "You might be prompted to enter your password a few times."

echo "Updating repositories..."
sudo apt update

echo "Installing packages..."
sudo apt install --no-install-recommends nala -y
sudo nala install --no-install-recommends fastfetch sway swaylock swayidle waybar rofi alacritty light curl libreoffice libreoffice-gtk3 modemmanager network-manager network-manager-gnome iwd bleachbit pavucontrol mtp-tools gvfs-fuse gvfs-backends nwg-look lxpolkit dunst btop dysk gcc g++ build-essential fzf zsh sxiv zip unzip thunar thunar-volman thunar-archive-plugin gvfs mpv xarchiver tar 7zip x11-xserver-utils tumbler libpam0g-dev libxcb-xkb-dev flatpak geany upower fonts-font-awesome -y

echo "Installing additional packages..."
sudo nala install qbittorrent flameshot neovim pipewire pipewire-pulse xwayland xdg-desktop-portal-wlr zathura zathura-pdf-poppler zathura-cb fonts-noto git -y

echo "Adding 32-bit architecture..."
sudo dpkg --add-architecture i386
sudo nala update

echo "Adding flathub repository..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "Disabling bluetooth..."
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth

echo "Cloning dotfiles..."
git clone https://github.com/Peppereli/dotfiles-deb ~/
cd ~/dotfiles-deb

echo "Copying dotfiles..."
mkdir -p ~/.config
cp config/* ~/.config/
cp .gtkrc-2.0 ~/
cp .Xresources ~/
cp .zshrc ~/
cd
echo "Removing dotfiles clone..."
rm -rf ~/dotfiles-deb

echo "Cloning fonts..."
git clone https://github.com/Peppereli/fonts ~/
cd
echo "Copying fonts..."
sudo cp -rf ~/fonts/* /usr/share/fonts/

echo "Updating font cache..."
fc-cache -f -v

echo "Removing fonts clone..."
rm -rf ~/fonts

echo "Installing brave-browser..."
curl -fsS https://dl.brave.com/install.sh | sh

echo "Cloning NvChad..."
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

echo "Cloning GTK themes..."
git clone https://github.com/Peppereli/themes ~/
cd ~/themes

echo "Extracting GTK themes..."
7z x themes.7z

echo "Copying GTK themes..."
sudo cp -rf ~/themes/themes/* /usr/share/themes/
sudo cp -rf ~/themes/icons/* /usr/share/icons/
cd

echo "Updating icon cache..."
gtk-update-icon-cache

echo "Removing themes clone..."
rm -rf ~/themes

echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh) $USER
sudo nala purge xterm -y

echo "Autoinstall script finished! Time to reboot. Run 'sudo reboot'"
