#!/bin/bash
#https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en-GB
cd
echo "WELCOME TO PEEPS' DEBIAN SETUP WIZARD! JUST SIT BACK AND RELAX WHILE THIS THING OF OURS DOES ITS THING."

echo "PLEASE ENTER YOUR LOGIN PASSWORD AND LET IT DO ITS THING"

echo "UPDATING REPOSITORIES..."
sudo apt update

echo "INSTALLING PACKAGES..."
sudo apt install --no-install-recommends nala -y
sudo nala install --no-install-recommends alacritty light sway swaybg swayidle swaylock waybar grim slurp fonts-font-awesome fzf fastfetch rofi wofi curl libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-gtk3 modemmanager network-manager network-manager-gnome iwd bleachbit pavucontrol mtp-tools gvfs-fuse gvfs-backends nwg-look lxpolkit dunst btop dysk gcc zsh sxiv zip unzip thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin gvfs mpv xarchiver tar 7zip x11-xserver-utils tumbler geany ffmpegthumbnailer cmus upower acpi g++ xwayland  fonts-noto fonts-noto-cjk fonts-noto-color-emoji xwaylandvideobridge zsh -y
sudo nala install pipewire pipewire-pulse qbittorrent xdg-desktop-portal-wlr zathura zathura-pdf-poppler zathura-cb neovim wl-clipboard yt-dlp -y

echo "ADDING 32-BIT ARCHITECTURE SUPPORT..."
sudo dpkg --add-architecture i386
sudo nala update

#echo "ADDING FLATHUB REPOSITORY..."
#sudo nala install --no-install-recommends flatpak
#flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "DISABLING BLUETOOTH..."
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth

echo "ENABLING fstrim (SSD OPTIMIZATION PROGRAM)..."
sudo systemctl enable fstrim.timer

echo "CLONING DOTFILES..."
cd
git clone https://github.com/Peppereli/dotfiles-deb
cd ~/dotfiles-deb

echo "COPYING DOTFILES..."
mkdir -p ~/.config
mkdir -p ~/Pictures
cp -rf config/* ~/.config/
cp .gtkrc-2.0 ~/
cp .Xresources ~/
cp .zshrc ~/zshrc
chmod +x ~/.config/sway/exit.sh
chmod +x ~/.config/sway/audio.sh
cd
echo "CLEANING DOTFILES CLONE..."
rm -rf ~/dotfiles-deb



echo "CLONING FONTS..."
git clone https://github.com/Peppereli/fonts
cd
echo "COPYING FONTS..."
sudo cp -rf ~/fonts/* /usr/share/fonts/

echo "UPDATING FONT CACHE..."
fc-cache -f -v

echo "CLEANING FONTS CLONE..."
rm -rf ~/fonts

echo "INSTALLING BRAVE BROWSER..."
curl -fsS https://dl.brave.com/install.sh | sh
cd
echo "CLONING NVCHAD..."
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo "TO INSTALL NVCHAD RUN 'nvim' AND LET IT INSTALL THE PLUGINS"
cd
echo "CLONING GTK THEMES..."
git clone https://github.com/Peppereli/themes
cd ~/themes

echo "EXTRACTING GTK THEMES..."
7z x themes.7z

echo "COPYING GTK THEMES..."
sudo cp -rf ~/themes/themes/* /usr/share/themes/
sudo cp -rf ~/themes/icons/* /usr/share/icons/
cd

echo "UPDATING ICON CACHE..."
gtk-update-icon-cache

echo "CLEANING THEMES CLONE..."
rm -rf ~/themes

echo "CHANGING THE SHELL TO ZSH..."
sudo chsh -s $(which zsh) $USER

echo "INSTALLING ZSH PLUGINS..."
cd
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "INSTALLING HEROIC GAMES LAUNCHER..."
wget https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.18.1/Heroic-2.18.1-linux-amd64.deb ~/
cd
sudo dpkg -i Heroic-2.18.1-linux-amd64.deb
rm Heroic-2.18.1-linux-amd64.deb

#echo "INSTALLING ly DISPLAY MANAGER..."
#echo "INSTALLING DEPENDENCIES..."
#sudo nala install --no-install-recommends build-essential libpam0g-dev libxcb-xkb-dev -y
#echo "DOWNLOADING ZIG..."
#wget https://ziglang.org/download/0.14.1/zig-x86_64-linux-0.14.1.tar.xz ~/
#cd
#tar -xvf zig-x86_64-linux-0.14.1.tar.xz
#mv zig-x86_64-linux-0.14.1 zig

#echo "CLONING ly REPOSITORY..."
#cd
#git clone https://codeberg.org/AnErrupTion/ly
#cd ly
#~/zig/zig build
#sudo ~/zig/zig build installexe
#sudo systemctl enable ly.service

echo "CLEANING UP INSTALLATION..."
cd
#rm zig-x86_64-linux-0.14.1.tar.xz
#rm -rf zig
sudo nala clean

echo "SETTING DEFAULT APPLICATIONS..."
xdg-mime default xarchiver.desktop application/zip
xdg-mime default xarchiver.desktop application/x-tar
xdg-mime default xarchiver.desktop application/x-gzip
xdg-mime default xarchiver.desktop application/x-bzip2
xdg-mime default xarchiver.desktop application/x-xz
xdg-mime default xarchiver.desktop application/x-rar
xdg-mime default xarchiver.desktop application/x-7z-compressed

xdg-mime default sxiv.desktop image/jpeg
xdg-mime default sxiv.desktop image/png
xdg-mime default sxiv.desktop image/gif
xdg-mime default sxiv.desktop image/bmp
xdg-mime default sxiv.desktop image/tiff
xdg-mime default sxiv.desktop image/webp

xdg-mime default org.pwmt.zathura.desktop application/pdf
xdg-mime default org.pwmt.zathura.desktop application/x-cbz
xdg-mime default org.pwmt.zathura.desktop application/x-cbr

xdg-mime default Thunar.desktop inode/directory

xdg-mime default brave-browser.desktop x-scheme-handler/http
xdg-mime default brave-browser.desktop x-scheme-handler/https
xdg-mime default brave-browser.desktop text/html
xdg-mime default brave-browser.desktop application/xhtml+xml

xdg-mime default mpv.desktop video/mpeg
xdg-mime default mpv.desktop video/mp4
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/x-flv
xdg-mime default mpv.desktop video/x-msvideo
xdg-mime default mpv.desktop video/quicktime
xdg-mime default mpv.desktop video/x-wmv
xdg-mime default mpv.desktop video/webm
xdg-mime default mpv.desktop video/3gpp
xdg-mime default mpv.desktop video/ogg

xdg-mime default mpv.desktop audio/mpeg
xdg-mime default mpv.desktop audio/x-wav
xdg-mime default mpv.desktop audio/ogg
xdg-mime default mpv.desktop audio/flac
xdg-mime default mpv.desktop audio/aac
xdg-mime default mpv.desktop audio/mp4
xdg-mime default mpv.desktop audio/x-ms-wma
xdg-mime default mpv.desktop audio/x-aiff
xdg-mime default mpv.desktop audio/opus
xdg-mime default mpv.desktop application/x-ogg

xdg-mime default nvim.desktop text/plain
xdg-mime default nvim.desktop text/markdown
xdg-mime default nvim.desktop application/json
xdg-mime default nvim.desktop application/xml
xdg-mime default nvim.desktop text/x-csrc
xdg-mime default nvim.desktop text/x-c++src
xdg-mime default nvim.desktop text/x-java
xdg-mime default nvim.desktop text/x-python
xdg-mime default nvim.desktop text/x-shellscript
xdg-mime default nvim.desktop application/x-sh
xdg-mime default nvim.desktop text/csv
xdg-mime default nvim.desktop application/yaml
xdg-mime default nvim.desktop text/yaml
xdg-mime default nvim.desktop text/x-log

echo "REMOVING UNNEEDED PACKAGES..."
sudo nala purge xterm -y
sudo nala clean

echo "INSTALLATION FINISHED! TIME TO REBOOT. RUN 'sudo reboot'."
