#!/bin/bash
echo "WELCOME TO PEEPS' DEBIAN SETUP WIZARD! JUST SIT BACK AND RELAX WHILE THIS THING OF OURS DOES ITS THING."

echo "Updating repositories..."
sudo apt update -y

echo "Installing packages..."
sudo apt install --no-install-recommends nala fastfetch sway swaylock swayidle waybar rofi alacritty light git curl fonts-font-awesome libreoffice libreoffice-gtk3 modemmanager network-manager network-manager-gnome iwd bleachbit pavucontrol mtp-tools gvfs-fuse gvfs-backends nwg-look lxpolkit dunst btop dysk gcc g++ build-essential fzf zsh sxiv zip unzip thunar thunar-volman thunar-archive-plugin gvfs mpv xarchiver tar 7zip x11-xserver-utils tumbler libpam0g-dev libxcb-xkb-dev flatpak geany -y

echo "Installing additional set of packages..."
sudo apt install qbittorrent flameshot neovim pipewire pipewire-pulse xwayland xdg-desktop-portal-wlr zathura zathura-pdf-poppler zathura-cb -y

echo "Adding 32-bit architecture..."
sudo dpkg --add-architecture i386
sudo apt update

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
cp config/* ~/.config
cp .gtkrc-2.0 ~/
cp .Xresources ~/
cp .zshrc ~/
cd
echo "Deleting dotfiles clone..."
rm -rf ~/dotfiles-deb

echo "Cloning fonts..."
git clone https://github.com/Peppereli/fonts ~/

echo "Copying fonts..."
sudo cp -rf ~/fonts/* /usr/share/fonts/

echo "Updating font cache..."
fc-cache -f -v

echo "Deleting fonts clone..."
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

echo "Deleting themes clone..."
rm -rf ~/themes

echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh) $USER
sudo apt purge xterm -y && sudo apt autoremove -y

echo "Autoinstall script finished! Time to reboot. Run 'sudo reboot'"
