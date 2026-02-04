#!/bin/bash

# 1. Update System
echo "--- Updating System ---"
sudo pacman -Syu --noconfirm

# 2. Install Git and Stow (Essential tools)
echo "--- Installing Essentials ---"
sudo pacman -S --noconfirm git stow

# 3. Install Native Packages from list
echo "--- Installing Core Packages ---"

# Install core dependencies first
sudo pacman -S - < packages/core-pkglist.txt

# Ask before installing personal apps
read -p "Install user-specific applications? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    sudo pacman -S - < packages/personal-pkglist.txt
fi

# 4. Install Yay (AUR Helper) if not present
if ! command -v yay &>/dev/null; then
  echo "--- Installing Yay ---"
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# 5. Install AUR Packages from list
echo "--- Installing AUR Packages ---"
yay -S --needed --noconfirm - <aurlist.txt

# 6. Apply Configs (Stow)
echo "--- Symlinking Dotfiles ---"
# This tells stow to simulate symlinking files from the current dir to Home
stow .

echo "--- Setup Complete! Reboot advisable. ---"
