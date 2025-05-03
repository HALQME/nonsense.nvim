#!/bin/bash
set -eu

install_dir="$HOME/.nonsense.nvim"
nvim_dir="$HOME/.config/nvim"

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Please install Git and try again."
  exit 1
fi
# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
  echo "Neovim is not installed. Please install Neovim and try again."
  exit 1
fi
# Check if Nonsense.nvim is installed
if [ ! -d "$install_dir"]; then
  echo "Nonsense.nvim is not installed. Please run install.sh first."
  echo "$ bash <(curl -sSf https://raw.githubusercontent.com/HALQME/nonsense.nvim/refs/heads/master/install.sh)"
  exit 1
fi
if [ $(readlink -f "$nvim_dir") != $(readlink -f "$install_dir/nvim") ]; then
  echo "Nonsense.nvim is not linked to $nvim_dir. Please run install.sh first."
  echo "$ bash <(curl -sSf https://raw.githubusercontent.com/HALQME/nonsense.nvim/refs/heads/master/install.sh)"
  exit 1
fi
# Check if the Nonsense.nvim directory is a git repository
if [ ! -d "$install_dir/.git" ]; then
  echo "Nonsense.nvim is not a git repository. Please run install.sh first."
  echo "$ bash <(curl -sSf https://raw.githubusercontent.com/HALQME/nonsense.nvim/refs/heads/master/install.sh)"
  exit 1
fi

# update Nonsense.nvim
cd "$install_dir"

git checkout master -q
update_output=$(git pull 2>&1)
latest=$(git describe --tags --abbrev=0)
git checkout tags/$latest
exit_code=$?

if [ $exit_code != 0 ]; then
  echo "Failed to update."
  exit 1
fi

echo "Updated to $latest"