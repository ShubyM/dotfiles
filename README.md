# Dotfiles

My tmux, neovim, Zed, ghostty, zsh, VS Code, and wallpaper configs.

## Contents

- `.tmux.conf` - Tmux configuration
- `.zshrc` - Shell configuration
- `.config/nvim/` - Neovim configuration
- `.config/ghostty/` - Ghostty terminal configuration
- `.config/zed/` - Zed settings, Vim keymap, and setup guide
- `bin/zed-setup` / `bin/zed-font` - Zed-only installer and font presets
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

## Zed

Load the Zed configuration independently from the other dotfiles:

```sh
cd ~/dotfiles
python3 bin/zed-setup
```

The installer backs up existing settings and keymaps, then copies this repo's
`.config/zed/settings.json` and `keymap.json` to Zed's user config directory.
Zed reloads both files automatically. After pulling updates, run it again.

The setup uses stock One Dark text and diff colors with a blurred background at
72% opacity, stock Zed fonts at 12px for code and 16px for the interface/file
explorer, and disabled ligatures. Double Shift opens the palette; `jj` leaves Vim
insert mode. `Cmd-Shift-D` or `Space g d` opens branch-relative diff review with a
changed-file list. `Space g b` selects the base branch. Python uses `ty` with type
diagnostics off and a minimal Ruff bug-check selection.

See [the Zed guide](.config/zed/README.md) for fresh-machine installation, Windows
and custom config paths, font presets, all keybindings, SSH/T3 worktrees, Python
language tools, and saving local changes back to the repository.

## Codex Pigeon Pet

The pigeon pet can be installed independently with:

```bash
mkdir -p ~/.codex/pets
cp -R ~/dotfiles/.codex/pets/pigeon ~/.codex/pets/pigeon
```

To select it, set `selected-avatar-id = "custom:pigeon"` under `[desktop]` in
`~/.codex/config.toml`, then restart Codex if it is already running.
