# Zed setup

This is the shared Zed configuration: stock One Dark text and diff colors,
blurred editor/terminal backgrounds at 72% opacity, stock fonts, Vim bindings,
branch-relative diff review, and quiet Python diagnostics. It was checked with
Zed Preview 1.24.1; use a current Zed release for the diff and keybinding actions.

## Load the config

Install [Zed](https://zed.dev/download) and Python 3, then clone this repository:

```sh
git clone https://github.com/ShubyM/dotfiles.git ~/dotfiles
cd ~/dotfiles
python3 bin/zed-setup
```

If you already have the repository, update it with `git pull --ff-only` and run
`python3 bin/zed-setup` from its root.

The Zed-only installer copies `settings.json` and `keymap.json` to:

- macOS/Linux: `~/.config/zed/` (or `$XDG_CONFIG_HOME/zed/` when configured).
- Windows: `%APPDATA%\Zed\`. In PowerShell, run `py -3 bin/zed-setup`.

Existing settings and keymaps are backed up together under the destination's
`backups/<timestamp>-before-dotfiles-install/` directory. Other Zed files,
extensions, accounts, and application data are left in place. The installer does
not change the other dotfiles or run the repository-wide `install.sh`.

For a different destination:

```sh
python3 bin/zed-setup --config-dir /path/to/zed-config
```

Zed reloads saved settings and keymaps automatically. Open the command palette
and use `zed: open settings file` or `zed: open keymap file` to confirm the loaded
files. This installs copies, so rerun the installer after pulling config updates.
Project-specific `.zed/settings.json` can override user settings.

## Appearance

- One Dark's built-in syntax and diff colors, with opaque menus and diff headers.
- Blurred editor and terminal backgrounds at 72% opacity where supported by the OS.
- Stock `.ZedMono` font for code and terminal at 12px; stock `.ZedSans` for the
  interface and file explorer at 16px.
- Font ligatures disabled; code line height 1.4.

Try another font pair from the repository root:

```sh
python3 bin/zed-font stock
python3 bin/zed-font apple
python3 bin/zed-font rex
```

`stock` uses Zed's bundled fonts. `apple` uses SF Mono and the system UI font;
SF Mono must be installed. `rex` uses JetBrainsMono Nerd Font Mono and the system
UI font; install that font first. It is a Rex-inspired approximation, not a
confirmed match to Superlogical's demo. Each switch backs up the settings and
preserves sizes, colors, and bindings. `--settings /path/to/settings.json` selects
a different settings file.

## Navigation and Vim

Double Shift opens the command palette. `jj` leaves Vim insert mode. The Space
bindings below are used in Vim normal mode or an empty editor pane.

| Key | Action |
| --- | --- |
| `Space Space` or `Space f f` | Find files |
| `Space p` | Command palette |
| `Space /` | Search current editor |
| `Space e` | Focus the file explorer |
| `Space b` | Switch tabs |
| `Ctrl-h/j/k/l` | Move between panes |
| `Space f s` | Save |
| `Cmd-Shift-D` or `Space g d` | Open branch diff with changed files on the left |
| `Space g b` | Choose the comparison branch |
| `Space g g` | Focus Git panel |
| `Space g o` | Focus changed-file outline |
| `] h` / `[ h` | Next / previous change |

## Diff review

Open the exact checkout or worktree you want to review. `Space g d` opens Zed's
unified diff and its changed-file outline. The default comparison is the
repository's default branch. Use `Space g b` to choose `origin/main`, `main`, or
another base; check the **Base** label in the diff toolbar. Added files use the
available content width beside the file list. The palette aliases `diff`, `base`,
`files`, and `changes` open the same actions.

## Python

Python uses `ty` for completion, hover, and navigation with type diagnostics
turned off. Ruff reports syntax errors and a small set of obvious bug checks:
`F6`, `F7`, `F821`, `F822`, and `F823`. Unused imports, unused variables, and style
checks stay quiet. `configurationPreference: editorFirst` applies this selection
in Zed without changing the repository's command-line Ruff configuration.

Zed can manage these language servers. Allow their initial download, or install
the binaries and configure their paths if your environment needs manual setup.
See [Zed's Python setup](https://zed.dev/docs/languages/python).

## Remote work and T3 Code

Use Zed's **Remote Projects** dialog (`Ctrl-Cmd-Shift-O` on macOS), connect using
the normal SSH host/alias, then open the exact remote worktree. With the Zed CLI
installed, a direct connection also works:

```sh
zed 'ssh://user@host/absolute/path/to/worktree'
```

On macOS, install that CLI through the palette action `cli: install cli binary`.
Zed's UI runs locally; the language servers, tasks, and terminals run remotely.
Local appearance settings remain on the client. To apply the same quiet Python
configuration on a Linux server, clone this repository there and run the
Zed-only installer for that server's user. Local and remote user settings are
separate, and project settings may override them.

T3 Code's **Open → Zed** opens a thread's remote checkout when T3 knows a usable
SSH route. Tailscale can provide that route, but SSH must authenticate to the
environment that owns the worktree. T3 Connect alone does not provide a Zed SSH
session. If T3 says **No SSH route** despite working Tailscale SSH, connect with
Zed's Remote Projects dialog and the same worktree path. This reviews the live
Git changes; T3's historical turn snapshots remain in T3.

See [Zed remote development](https://zed.dev/docs/remote-development) and
[T3 remote access](https://github.com/pingdotgg/t3code/blob/main/docs/user/remote-access.md).

## Save local changes back to this repository

After editing the loaded config, copy the two files back before committing:

```sh
cp ~/.config/zed/settings.json .config/zed/settings.json
cp ~/.config/zed/keymap.json .config/zed/keymap.json
```

Adjust the source paths if using Windows or a custom config directory. Copy only
the settings/keymap you want to share; account credentials, SSH hosts, and local
backup folders do not need to be added.
