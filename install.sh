#!/bin/bash

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
sudo pacman -S --noconfirm rofi-greenclip

# Install neovim
sudo pacman -S --noconfirm neovim

# Install picom
sudo pacman -S --noconfirm picom

# Install starship
sudo pacman -S --noconfirm starship

# Install tmux
sudo pacman -S --noconfirm tmux

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Assuming Oh My Zsh is used, install zsh plugins
# Install zsh syntax highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installation complete."
