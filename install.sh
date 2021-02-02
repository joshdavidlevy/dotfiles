#!/bin/bash

dotfiles=~/.dotfiles

echo "#=========="
echo "Set up Authorized Keys"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  touch authorized_keys
  wget https://github.com/joshdavidlevy.keys -O authorized_keys
  chmod 644 authorized_keys
  cat ~/.ssh/authorized_keys >> authorized_keys
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
  mv  $dotfiles/authorized_keys ~/.ssh/authorized_keys
fi


echo "#=========="
echo "RPM Fusion"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo dnf update
  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
fi


echo "#=========="
echo "DNF Packages"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sudo dnf update
  sudo dnf install -y audacity
  sudo dnf install -y brave-browser
  sudo dnf install -y calibre
  sudo dnf install -y compat-lua
  sudo dnf install -y compat-lua-devel
  sudo dnf install -y dosbox
  sudo dnf install -y ffmpeg
  sudo dnf install -y gcc-c++
  sudo dnf install -y gimp
  sudo dnf install -y git
  sudo dnf install -y gthumb
  sudo dnf install -y htop
  sudo dnf install -y love
  sudo dnf install -y lutris
  sudo dnf install -y micro
  sudo dnf install -y obs-studio
  sudo dnf install -y okular
  sudo dnf install -y p7zip
  sudo dnf install -y retroarch
  sudo dnf install -y ruby
  sudo dnf install -y ruby-devel
  sudo dnf install -y steam
  sudo dnf install -y telegram-desktop
  sudo dnf install -y tilix
  sudo dnf install -y tilix-nautilus
  sudo dnf install -y youtube-dl
  sudo dnf install -y zsh   
fi


echo "#=========="
echo "Oh My Zsh"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O ohmyzsh.sh
  sh ohmyzsh.sh
  rm ohmyzsh.sh
fi


echo "#=========="
echo "Moonscript"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  wget https://github.com/luarocks/luarocks/archive/v3.5.0.zip
  unzip v3.5.0.zip
  cd luarocks-3.5.0
  ./configure --with-lua-include=/usr/include/lua-5.1/
  make
  sudo make install
  cd ..
  rm -rf luarocks-3.5.0
  rm -rf v3.5.0.zip
  sudo luarocks install moonscript
fi


echo "#=========="
echo "Atom"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  wget https://atom.io/download/rpm -O atom.rpm
  sudo dnf install -y atom.rpm
  rm -rf atom.rpm
  apm install build 
  apm install file-icons 
  apm install git-plus 
  apm install langage-moonscript 
  apm install language-pico8 
  apm install linter-moonscript
  apm install minimap
  apm install pigments 
  apm install minimap-pigments
  apm install pastel-jelly-syntax
fi


echo "#=========="
echo "Discord"
echo "#=========="
read -p "Y/N? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
  cd ~/.local/share
  rm -rf discord-master
  wget https://github.com/RPM-Outpost/discord/archive/master.zip
  unzip master.zip
  cd ~/.local/share/discord-master
  ./create-package.sh stable
  cd $dotfiles
fi


echo "#=========="
echo "Install dotfiles"
echo "#=========="
ln -sf $dotfiles/.zshrc ~/.zshrc
ln -sf $dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/tilix/schemes
ln -sf $dotfiles/.config/tilix/schemes/Dracula.json ~/.config/tilix/schemes/Dracula.json

mkdir -p ~/.dosbox
ln -sf $dotfiles/.dosbox/dosbox-0.74-3.conf ~/.dosbox/dosbox-0.74-3.conf

mkdir -p ~/.config/neofetch
ln -sf $dotfiles/.config/neofetch/config.conf ~/.config/neofetch/config.conf


echo "#=========="
echo "Done!"
echo "#=========="
