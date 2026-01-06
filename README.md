# Dotfiles

My personal dotfiles for macOS.

## Contents

- `.zshrc` - Zsh configuration
- `.zprofile` - Zsh profile
- `.bash_profile` - Bash profile
- `.vimrc` - Vim configuration
- `.tmux.conf` - Tmux configuration
- `.gitconfig` - Git configuration
- `.config/nvim/` - Neovim configuration
- `.config/ghostty/` - Ghostty terminal configuration

## Installation

```bash
git clone https://github.com/ShubyM/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Manual Setup

If you prefer manual installation, create symlinks:

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
# etc.
```
