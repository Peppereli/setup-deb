#https://chromewebstore.google.com/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en-GB
set -e
echo "WELCOME TO PEEPS' DEBIAN SETUP WIZARD! JUST SIT BACK AND RELAX WHILE THIS THING OF OURS DOES ITS THING."

echo "PLEASE ENTER YOUR LOGIN PASSWORD AND LET IT DO ITS THING"

echo "UPDATING REPOSITORIES..."
sudo apt update

echo "INSTALLING PACKAGES..."
sudo apt install --no-install-recommends foot light sway swaybg swayidle swaylock ffmpeg yt-dlp waybar grim slurp fzf rofi curl modemmanager network-manager network-manager-gnome iwd bleachbit pavucontrol mtp-tools gvfs-fuse gvfs-backends nwg-look lxpolkit dunst btop gcc zsh gthumb zip unzip thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin gvfs mpv xarchiver tar 7zip x11-xserver-utils tumbler ffmpegthumbnailer acpi g++ xwayland fonts-noto fonts-noto-cjk fonts-noto-color-emoji xwaylandvideobridge zsh-autosuggestions zsh-syntax-highlighting fonts-liberation libreoffice-writer libreoffice-calc libreoffice-impress libreoffice-gtk3 fonts-font-awesome gammastep -y
sudo nala install pipewire pipewire-pulse qbittorrent xdg-desktop-portal-wlr zathura zathura-pdf-poppler zathura-cb neovim -y

echo "ADDING 32-BIT ARCHITECTURE SUPPORT..."
sudo dpkg --add-architecture i386
sudo apt update

echo "ADDING FLATHUB REPOSITORY..."
sudo apt install --no-install-recommends flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "DISABLING BLUETOOTH..."
sudo systemctl stop bluetooth
sudo systemctl disable bluetooth

echo "ENABLING fstrim (SSD OPTIMIZATION PROGRAM)..."
sudo systemctl enable fstrim.timer

echo "CLONING DOTFILES..."
mkdir -p ~/Pictures
mkdir -p ~/Music
mkdir -p ~/movi
mkdir -p ~/Documents
cd
git clone https://github.com/Peppereli/dotfiles-deb
cd ~/dotfiles-deb

echo "COPYING DOTFILES..."
rm -rf .git
cp -r "." ~/
chmod +x ~/.config/sway/exit.sh
chmod +x ~/.config/waybar/powermenu
chmod +x ~/.config/fetch
cd
echo "CLEANING DOTFILES CLONE..."
rm -rf ~/dotfiles-deb

echo "UPDATING FONT CACHE..."
fc-cache -f -v

echo "INSTALLING LIBREWOLF BROWSER..."
sudo apt update && sudo apt install extrepo -y

sudo extrepo enable librewolf

sudo apt update && sudo apt install librewolf

echo "UPDATING ICON CACHE..."
gtk-update-icon-cache

echo "CHANGING THE SHELL TO ZSH..."
sudo chsh -s $(which zsh) $USER

echo "SETTING DEFAULT APPLICATIONS..."
xdg-mime default xarchiver.desktop application/zip
xdg-mime default xarchiver.desktop application/x-tar
xdg-mime default xarchiver.desktop application/x-gzip
xdg-mime default xarchiver.desktop application/x-bzip2
xdg-mime default xarchiver.desktop application/x-xz
xdg-mime default xarchiver.desktop application/x-rar
xdg-mime default xarchiver.desktop application/x-7z-compressed

xdg-mime default gthumb.desktop image/jpeg
xdg-mime default gthumb.desktop image/png
xdg-mime default gthumb.desktop image/gif
xdg-mime default gthumb.desktop image/bmp
xdg-mime default gthumb.desktop image/tiff
xdg-mime default gthumb.desktop image/webp

xdg-mime default org.pwmt.zathura.desktop application/pdf
xdg-mime default org.pwmt.zathura.desktop application/x-cbz
xdg-mime default org.pwmt.zathura.desktop application/x-cbr

xdg-mime default thunar.desktop inode/directory
gio mime inode/directory thunar.desktop

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
sudo apt update && sudo apt full-upgrade
sudo apt autoremove
sudo apt clean

echo "INSTALLATION FINISHED! TIME TO REBOOT. RUN 'sudo reboot'."
