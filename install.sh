#!/bin/bash

# Dotfiles installation script
# Creates symlinks from ~ to dotfiles in this directory

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing dotfiles from $DOTFILES_DIR"

# Backup existing files and create symlinks
link_file() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi
    
    echo "Linking $src -> $dest"
    ln -sf "$src" "$dest"
}

# Tmux
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Neovim & Ghostty
mkdir -p "$HOME/.config"
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/.config/ghostty" "$HOME/.config/ghostty"

# VS Code
mkdir -p "$HOME/Library/Application Support/Code/User"
mkdir -p "$HOME/.vscode/extensions"
link_file "$DOTFILES_DIR/.config/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
rm -rf "$HOME/.vscode/extensions/shubym.pigeon-frost-theme-0.0.1"
cp -R "$DOTFILES_DIR/.config/vscode/themes/pigeon-frost" "$HOME/.vscode/extensions/shubym.pigeon-frost-theme-0.0.1"

# Wallpaper
mkdir -p "$HOME/Pictures"
link_file "$DOTFILES_DIR/.config/wallpapers/back.png" "$HOME/Pictures/back.png"

echo "Done!"
