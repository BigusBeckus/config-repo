#!/bin/bash

# Define the config directories
nvim_config_dir=~/.config/nvim
zsh_config_dir=~/.oh-my-zsh

echo "Warning: This will overwrite any existing configs in the following folders"
echo "  ~/.config/nvim"
echo "  ~/.oh-my-zsh/custom"
read -p "Are you sure you want to continue? (y/N) " -n 1 -rs
echo
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
	# Delete the nvim config directory if it exists
	if [ -d "$nvim_config_dir" ]; then
		rm -r "$nvim_config_dir"
	fi
	# Create the directory and copy the config files
	mkdir -p "$nvim_config_dir"
	cp -r nvim/* "$nvim_config_dir"
	echo "Neovim config files copied."

	if [ -d "$zsh_config_dir" ]; then
		# Delete the oh-my-zsh custom config directory if it exists
		rm -r "$zsh_config_dir"/custom
	fi
	# Create the directory and copy the config files
	mkdir -p "$zsh_config_dir"/custom
	cp -r zsh/.oh-my-zsh/custom/* "$zsh_config_dir"/custom
	echo "Oh-My-Zsh config files copied."
else
	echo "Aborted"
	exit 1
fi
