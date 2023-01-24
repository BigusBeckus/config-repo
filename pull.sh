#!/bin/sh

# Define the config directories
nvim_config_dir=~/.config/nvim
zsh_config_dir=~/.oh-my-zsh

# Check if the config directories exist
if [ -d "$nvim_config_dir" ]; then
	# Create the nvim directory if it doesn't already exist
	mkdir -p nvim
	# Copy the config files
	cp -r "$nvim_config_dir"/* nvim
	echo "Neovim config files copied."
else
	echo "Neovim config directory not found."
fi

if [ -d "$zsh_config_dir" ]; then
	# Create the zsh/oh-my-zsh directory if it doesn't already exist
	mkdir -p zsh/.oh-my-zsh/custom
	# Copy the config files
	cp -r "$zsh_config_dir"/custom/* zsh/.oh-my-zsh/custom
	echo "Oh-My-Zsh config files copied."
else
	echo "Oh-My-Zsh config directory not found."
fi

dconf dump /com/gexperts/Tilix/ >tilix/tilix.dconf && echo "Tilix config copied"
