echo "INSTALLING OH MY ZSH!..."
cd
sudo apt install --no-install-recommends nala -y
sudo nala install --no-install-recommends alacritty light sway swaybg swayidle swaylock waybar grim slurp fonts-font-awesome fzf fastfetch rofi wofi curl libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-gtk3 modemmanager network-manager network-manager-gnome iwd bleachbit pavucontrol mtp-tools gvfs-fuse gvfs-backends nwg-look lxpolkit dunst btop dysk gcc zsh sxiv zip unzip thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin gvfs mpv xarchiver tar 7zip x11-xserver-utils tumbler geany ffmpegthumbnailer cmus upower acpi g++ pipewire wireplumber pipewire-pulse qbittorrent qt6-wayland neovim xwayland xdg-desktop-portal-wlr zathura zathura-pdf-poppler zathura-cb fonts-noto fonts-noto-cjk fonts-noto-color-emoji xwaylandvideobridge zsh -y

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
