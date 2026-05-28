# Dotfiles

My tmux, neovim, ghostty, zsh, VS Code, and wallpaper configs.

## Contents

- `.tmux.conf` - Tmux configuration
- `.zshrc` - Shell configuration
- `.config/nvim/` - Neovim configuration
- `.config/ghostty/` - Ghostty terminal configuration
- `.config/vscode/themes/pigeon-frost/` - VS Code Pigeon Frost theme
- `.config/Code/User/settings.json` - VS Code user settings
- `.config/wallpapers/back.png` - Current desktop wallpaper
- `.codex/pets/pigeon/` - Codex pigeon pet with spinning propeller hat

## Installation

```bash
git clone https://github.com/ShubyM/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## Codex Pigeon Pet

The pigeon pet can be installed independently with:

```bash
mkdir -p ~/.codex/pets
cp -R ~/dotfiles/.codex/pets/pigeon ~/.codex/pets/pigeon
```

To select it, set `selected-avatar-id = "custom:pigeon"` under `[desktop]` in
`~/.codex/config.toml`, then restart Codex if it is already running.
