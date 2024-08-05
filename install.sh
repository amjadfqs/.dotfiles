#!/bin/bash

# Update the system and install necessary dependencies
sudo pacman -Syu --noconfirm
sudo pacman -S --needed base-devel git --noconfirm

# Clone the paru repository from AUR
git clone https://aur.archlinux.org/paru.git

# Change to the paru directory
cd paru

# Build and install paru
makepkg -si --noconfirm

# Clean up by removing the cloned repository
cd ..
rm -rf paru

# Install alacritty terminal
sudo pacman -S --noconfirm alacritty

# Install polybar
sudo pacman -S --noconfirm polybar

# Install zsh
sudo pacman -S --noconfirm zsh

# Install zsh plugins: zoxide
sudo pacman -S --noconfirm zoxide

# Install rofi
sudo pacman -S --noconfirm rofi

# Install rofi-greenclip
paru -S --noconfirm rofi-greenclip

# Install neovim
sudo pacman -S --noconfirm neovim

# Install picom
sudo pacman -S --noconfirm picom

# Install starship
sudo pacman -S --noconfirm starship

# Install tmux
sudo pacman -S --noconfirm tmux

# Install brightnessctl
sudo pacman -S --noconfirm brightnessctl

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Assuming Oh My Zsh is used, install zsh plugins
# Install zsh syntax highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installation complete."
