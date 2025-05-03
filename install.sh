#!/bin/bash
# This script installs the neovim configuration for the Nonsense.nvim.
# This is expected to be run on macOS or Linux with Neovim installed.
# It checks if Neovim is installed and if the version is 0.11.0 or later.
# It also checks if the ~/.config/nvim directory exists and renames it to ~/.config/nvim.bak if it does.
set -eu

# Configurations
nvim_version=$(nvim --version | head -n1 | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sed 's/v//')
required_version="0.11.0"
install_dir="$HOME/.nonsense.nvim"

## Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install Git and try again."
  exit 1
fi
## Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
  echo "Neovim is not installed. Please install Neovim and try again."
  exit 1
fi
## make sure installed neovim version is 0.11.0 or later
if [ "$(printf '%s\n' "$required_version" "$nvim_version" | sort -V | head -n1)" != "$required_version" ]; then
  echo "Neovim version is less than $required_version. Please update Neovim."
  exit 1
fi

echo "Neovim version is $nvim_version, which is compatible with Nonsense.nvim."
echo -n "Are you sure to install Nonsense.nvim? [y/N] "
read -r answer
if [[ ! $answer =~ ^[Yy]$ ]]; then
  echo "Installation cancelled."
  exit 0
fi

# Download the Nonsense.nvim repository
if [ ! -d $install_dir ]; then
  echo "Downloading Nonsense.nvim to $install_dir"
  git clone https://github.com/HALQME/nonsense.nvim.git "$install_dir"
  if [ $? != 0 ]; then
    echo "Failed to clone Nonsense.nvim repository. Please check your internet connection and try again."
    exit 1
  fi
fi

if [ -d ${HOME}/.config/nvim ]; then
  # rename and backup
  echo "${HOME}/.config/nvim found, renaming to ${HOME}/.config/nvim.bak"
  mv ${HOME}/.config/nvim ${HOME}/.config/nvim.bak
else
  echo "${HOME}/.config/nvim not found, skipping backup"
fi

# make symbolic link
echo "Creating symbolic link to $install_dir/nvim in ${HOME}/.config/nvim"
ln -s "$install_dir/nvim" "${HOME}/.config/nvim"

if [ $? == 0 ]; then
  echo "Complete! You can now start using Neovim with the new configuration."
  echo "If you encounter any issues, please check the backup at ${HOME}/.config/nvim.bak"
else
  echo "Failed to create symbolic link. Please check the permissions and try again."
fi
