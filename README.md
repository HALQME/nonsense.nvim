# nonsense.nvim

## Requirements

* git
* curl
* neovim v0.11.0 or higher

## Installation

On installation of this nonsense.nvim configuration, the pre-existing ~/.config/nvim directory will be moved to ~/.config/nvim.bak.  
After that, create a symbolic link; /path/to/nonsense.nvim/nvim -> ~/.config/nvim.

```bash
bash <(curl -sSf https://raw.githubusercontent.com/HALQME/nonsense.nvim/refs/heads/master/install.sh)
```
### Development installation

If you want to use the latest version of nonsense.nvim, you can clone the repository and create a symbolic link to your Neovim configuration directory.

```bash
# Move backup existing nvim configuration
mv ~/.config/nvim ~/.config/nvim.bak

# Clone the repository
git clone https://github.com/HALQME/nonsense.nvim.git ~/nonsense.nvim

# Create a symbolic link
ln -s ~/nonsense.nvim/nvim ~/.config/nvim
```

## Update

With the update script, you can easily update your nonsense.nvim installation to the latest version.

```bash
# To update your installation, run the following command:
bash <(curl -sSf https://raw.githubusercontent.com/HALQME/nonsense.nvim/refs/heads/master/update.sh)
```

## Uninstall
If you want to uninstall nonsense.nvim, execute following command:

```bash
# Remove the symbolic link
rm ~/.config/nvim
# Restore the backup
mv ~/.config/nvim.bak ~/.config/nvim
# Additional cleanup if necessary
# Optionally remove the downloaded repository. Default location is ~/.nonsense.nvim
rm -rf ~/.nonsense.nvim
```