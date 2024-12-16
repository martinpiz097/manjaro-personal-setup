#!/bin/bash

HYPRLAND_SETUP_PATH=~/exotic-os-setup/compositors/hyprland
OWN_BASE_PATH=$HYPRLAND_SETUP_PATH/dotfiles
CONFIG_PATH=~/.config
ORIGINAL_DOTFILES_PATH=~/dotfiles/.config

echo "Eliminando setup original..."
rm -rf $CONFIG_PATH/ml4w-hyprland-settings 2>/dev/null
rm -rf $ORIGINAL_DOTFILES_PATH 2>/dev/null

echo "Cargando setup personalizado..."

unlink ~/hyprland-setup 2>/dev/null
ln -s $HYPRLAND_SETUP_PATH ~/hyprland-setup
ln -s $OWN_BASE_PATH $ORIGINAL_DOTFILES_PATH
ln -s $ORIGINAL_DOTFILES_PATH/ml4w-hyprland-settings $CONFIG_PATH/ml4w-hyprland-settings

echo "Setup finalizado! Recargando UI..."
$ORIGINAL_DOTFILES_PATH/waybar/launch.sh
hyprctl reload

echo "Modificando comportamiento del boton de apagado, favor reiniciar logind"
sudo sed -i 's/#HandlePowerKey.*/HandlePowerKey=ignore/' /etc/pacman.conf
