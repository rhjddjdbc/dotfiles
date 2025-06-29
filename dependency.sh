#! /bin/sh

# ------
# ble.sh
# ------
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local


# ----------
# Chaotic-AUR
# ----------
set -euo pipefail

echo "==> Importing Chaotic-AUR GPG key..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

echo "==> Installing Chaotic-AUR keyring and mirrorlist..."
sudo pacman -U --noconfirm \
  https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst \
  https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst

echo "==> Adding Chaotic-AUR to /etc/pacman.conf (if not already present)..."
if ! grep -q '^

\[chaotic-aur\]

' /etc/pacman.conf; then
  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
else
  echo "Chaotic-AUR is already present in pacman.conf."
fi

echo "==> Updating package database..."
sudo pacman -Sy

echo "Chaotic-AUR has been successfully set up."


# ---
# yay
# ---
if ! command -v yay &> /dev/null; then
  echo "yay not found – installing..."
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
else
  echo "yay is already installed."
fi

# -------
# install
# -------
yay -S wayland mako gnudb qt5-wayland qt6-wayland swayfx qutebrowser kitty wlogout waybar rofi-wayland yazi mpvpaper newsboat zoxide bat htop neovim fastfetch hyfetch exa fzf w3m httrack yt-dlp calcure bluetui navi podman 7zip zip xz clang lua rust go ffmpeg pandoc translate-shell pycp battop pulsemixer ani-cli-git lobster-git starship thefuck less python impala navi dysk foot astroterm-bin mpv pass ollama virt-manager libreoffice ttf-firacode-nerd 

# -----------
# pip & cargo
# -----------
cargo install krabby
python -m venv ~/venvs/ricksay-env
source ~/venvs/ricksay-env/bin/activate
pip install ricksay
deactivate
# ------
# packer
# ------
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# ----
# doas
# ----
setup_doas_and_remove_sudo() {
  if ! command -v doas &>/dev/null; then
    echo "Installing doas..."
    sudo pacman -S --noconfirm opendoas

    echo "Creating /etc/doas.conf..."
    echo 'permit persist :wheel' | sudo tee /etc/doas.conf > /dev/null
  fi

  echo "Removing sudo..."
  doas pacman -Rdd --noconfirm sudo
}
setup_doas_and_remove_sudo

