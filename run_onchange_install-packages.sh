#!/bin/sh
sudo apt install -y tmux fish 
sudo snap install obsidian --classic
sudo snap install alacritty --classic
sudo snap install nvim --classic
# curl -f https://zed.dev/install.sh | sh

wget -P /tmp https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
mkdir ~/.fonts
unzip /tmp/JetBrainsMono.zip -d ~/.fonts


