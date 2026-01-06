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

# Neovim & Ghostty
mkdir -p "$HOME/.config"
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/.config/ghostty" "$HOME/.config/ghostty"

echo "Done!"
