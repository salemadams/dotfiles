# dotfiles

Personal macOS configuration files for a productive development environment.

## Overview

This repository contains my carefully curated dotfiles for macOS, featuring:

- **Neovim** - Modern, LSP-powered text editor configuration
- **AeroSpace** - Tiling window manager for macOS
- **Karabiner** - Advanced keyboard customization
- **Lazygit** - Beautiful terminal UI for git operations
- **Tmux** - Terminal multiplexer

## Quick Start

This is a bare git repository setup. To replicate this configuration:

```bash
# Clone the repository
git clone --bare git@github.com:salemadams/dotfiles.git ~/.dotfiles

# Checkout the files
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout

# Set up alias for easier dotfiles management
echo "alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> ~/.zshrc
source ~/.zshrc

# Hide untracked files
dotfiles config status.showUntrackedFiles no
```

## Configuration Structure

```
~/
├── .config/
│   ├── aerospace/        # Window manager
│   ├── karabiner/        # Keyboard customization
│   ├── lazygit/          # Git UI
│   └── nvim/             # Neovim editor
├── .tmux.conf            # Tmux configuration
└── KEYBINDINGS.md        # This document
```

---

# Keybindings Reference

Complete reference for all custom keybindings across macOS configuration files.

## Table of Contents
- [Karabiner (System-wide Keyboard Remapping)](#karabiner-system-wide-keyboard-remapping)
- [AeroSpace (Window Manager)](#aerospace-window-manager)
- [Tmux (Terminal Multiplexer)](#tmux-terminal-multiplexer)
- [Neovim (Text Editor)](#neovim-text-editor)
  - [Core Keymaps](#core-keymaps)
  - [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
  - [Neo-tree (File Explorer)](#neo-tree-file-explorer)
  - [LSP (Language Server)](#lsp-language-server)
  - [Bufferline (Buffer Management)](#bufferline-buffer-management)
  - [Blink.cmp (Completion)](#blinkcmp-completion)
  - [Autopairs (Auto-closing Brackets)](#autopairs-auto-closing-brackets)
  - [Mini.nvim (Surround)](#minivim-surround)
  - [Oil.nvim (File Explorer)](#oilnvim-file-explorer)

---

## Karabiner (System-wide Keyboard Remapping)

**Config:** `~/.config/karabiner/karabiner.json`

| Key | Mapped To | Description |
|-----|-----------|-------------|
| `Caps Lock` | `Escape` | Caps Lock acts as Escape |
| `Escape` | `None` | Native Escape key is disabled |

---

## AeroSpace (Window Manager)

**Config:** `~/.config/aerospace/aerospace.toml`

### Layout Management

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + /` | Toggle tiles layout | Cycle horizontal/vertical tiles |
| `Alt + ,` | Toggle accordion layout | Cycle horizontal/vertical accordion |

### Window Focus

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + H` | Focus left | Move focus to left window |
| `Alt + J` | Focus down | Move focus to window below |
| `Alt + K` | Focus up | Move focus to window above |
| `Alt + L` | Focus right | Move focus to right window |

### Window Movement

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + Shift + H` | Move left | Move window to the left |
| `Alt + Shift + J` | Move down | Move window down |
| `Alt + Shift + K` | Move up | Move window up |
| `Alt + Shift + L` | Move right | Move window to the right |

### Window Resizing

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + -` | Decrease size | Resize window smaller by 50px |
| `Alt + =` | Increase size | Resize window larger by 50px |

### Workspace Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + 1-9` | Switch workspace | Go to workspace 1-9 |
| `Alt + A-Z` | Switch workspace | Go to workspace A-Z (excluding H, J, K, L) |
| `Alt + Tab` | Previous workspace | Toggle between current and previous workspace |

### Move Window to Workspace

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + Shift + 1-9` | Move to workspace | Move window to workspace 1-9 |
| `Alt + Shift + A-Z` | Move to workspace | Move window to workspace A-Z (excluding H, J, K, L) |
| `Alt + Shift + Tab` | Move to next monitor | Move workspace to next monitor |

### Service Mode

| Key | Action | Description |
|-----|--------|-------------|
| `Alt + Shift + ;` | Enter service mode | Enter service mode for advanced commands |

**Service Mode Keybindings:**

| Key | Action | Description |
|-----|--------|-------------|
| `Esc` | Reload config | Reload AeroSpace config and exit service mode |
| `R` | Reset layout | Flatten workspace tree and exit service mode |
| `F` | Toggle floating | Toggle between floating and tiling layout |
| `Backspace` | Close others | Close all windows except current |
| `Alt + Shift + H/J/K/L` | Join with direction | Join current window with window in direction |
| `↓` | Volume down | Decrease system volume |
| `↑` | Volume up | Increase system volume |
| `Shift + ↓` | Mute | Set volume to 0 and exit service mode |

---

## Tmux (Terminal Multiplexer)

**Config:** `~/.tmux.conf`

**Prefix Key:** `Ctrl + A` (remapped from default `Ctrl + B`)

### Session & Configuration

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl + A` then `r` | Reload config | Reload tmux configuration file |
| `Ctrl + A` then `R` | Renumber windows | Renumber all windows from base-index |

### Window Management

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl + A` then `\|` | Split horizontal | Split window horizontally |
| `Ctrl + A` then `-` | Split vertical | Split window vertically |
| `Ctrl + A` then `0-9` | Switch window | Go to window by number (windows start at index 1) |

### Pane Management

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl + H` | Focus left pane | Move to pane on the left (vim-tmux-navigator) |
| `Ctrl + J` | Focus down pane | Move to pane below (vim-tmux-navigator) |
| `Ctrl + K` | Focus up pane | Move to pane above (vim-tmux-navigator) |
| `Ctrl + L` | Focus right pane | Move to pane on the right (vim-tmux-navigator) |
| `Ctrl + A` then `H` | Resize left | Resize pane 5 cells to the left |
| `Ctrl + A` then `J` | Resize down | Resize pane 5 cells down |
| `Ctrl + A` then `K` | Resize up | Resize pane 5 cells up |
| `Ctrl + A` then `L` | Resize right | Resize pane 5 cells to the right |
| `Ctrl + A` then `m` | Maximize toggle | Toggle pane zoom (maximize/restore) |

### Copy Mode (Vi Mode)

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl + A` then `[` | Enter copy mode | Enter copy/scroll mode |
| `v` | Begin selection | Start visual selection (in copy mode) |
| `y` | Copy selection | Copy selected text (in copy mode) |
| `q` | Exit copy mode | Return to normal mode |

### Special Features

- **Mouse support enabled** - Click to select panes, resize with drag, scroll with mouse wheel
- **Vim integration** - Seamless navigation between vim splits and tmux panes with `Ctrl + H/J/K/L`
- **Session persistence** - tmux-resurrect and tmux-continuum auto-save and restore sessions
- **Window/pane indexing** - Windows and panes start at index 1 (not 0)

---

## Lazygit (Git UI)

**Config:** `~/.config/lazygit/config.yml`

### Custom Commands

| Key | Action | Context | Description |
|-----|--------|---------|-------------|
| `C` | Conventional commit | Files view | Interactive conventional commit with type, scope, and description (overrides default "commit with editor") |

**Conventional Commit Types:**
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation only changes
- `style` - Formatting and whitespace changes
- `refactor` - Code changes that don't fix bugs or add features
- `perf` - Code changes that improve performance
- `test` - Adding or correcting tests
- `build` - Build system or dependency changes
- `ci` - CI configuration and scripts
- `chore` - Other maintenance changes
- `revert` - Reverts a previous commit

### Common Default Keybindings

**Files View:**
| Key | Action | Description |
|-----|--------|-------------|
| `Space` | Stage/unstage | Toggle staging for selected file |
| `a` | Stage all | Stage all files |
| `A` | Unstage all | Unstage all files |
| `c` | Commit | Quick commit with message |
| `C` | ~~Commit using git editor~~ | **DISABLED** - Replaced by custom conventional commit |
| `Shift+A` | Amend last commit | Amend without editing message |
| `d` | Discard changes | Discard changes for selected file |
| `e` | Edit file | Open file in $EDITOR |
| `o` | Open file | Open file with default application |
| `i` | Ignore | Add to .gitignore |
| `r` | Refresh | Refresh git status |
| `s` | Stash | Stash all changes |
| `Shift+S` | Stash options | Show stash options menu |

**Commits View:**
| Key | Action | Description |
|-----|--------|-------------|
| `Enter` | View commit | View commit files |
| `c` | Checkout commit | Checkout commit as detached HEAD |
| `d` | Delete commit | Drop/delete commit |
| `r` | Reword commit | Edit commit message |
| `Shift+R` | Rebase | Interactive rebase from commit |
| `f` | Fixup commit | Mark as fixup for previous commit |
| `s` | Squash commit | Squash into previous commit |
| `g` | Reset to commit | Reset HEAD to this commit |
| `Ctrl+O` | Copy commit SHA | Copy SHA to clipboard |
| `t` | Revert commit | Create revert commit |
| `T` | Tag commit | Create tag at commit |

**Branches View:**
| Key | Action | Description |
|-----|--------|-------------|
| `Space` | Checkout branch | Switch to selected branch |
| `n` | New branch | Create new branch |
| `o` | Create pull request | Open PR creation in browser |
| `Shift+O` | View pull request | View PR in browser |
| `d` | Delete branch | Delete local branch |
| `Shift+D` | Force delete | Force delete local branch |
| `r` | Rebase branch | Rebase current branch onto selected |
| `M` | Merge into current | Merge selected branch into current |
| `f` | Fast-forward | Fast-forward current branch |
| `g` | Reset to branch | Reset current branch to selected |

**Global Keybindings:**
| Key | Action | Description |
|-----|--------|-------------|
| `1-5` | Switch view | Jump to Files(1), Branches(2), Commits(3), Stash(4), Reflog(5) |
| `Tab` | Next view | Cycle to next panel |
| `Shift+Tab` | Previous view | Cycle to previous panel |
| `[` / `]` | Next/previous tab | Switch between tabs in current view |
| `z` | Undo | Undo last action |
| `Ctrl+Z` | Redo | Redo last undone action |
| `P` | Push | Push to remote |
| `Shift+P` | Push options | Show push options menu |
| `p` | Pull | Pull from remote |
| `f` | Fetch | Fetch from remote |
| `q` | Quit | Exit lazygit |
| `?` | Help | Show help menu |
| `Esc` | Cancel | Cancel current operation |

---

## Neovim (Text Editor)

**Config:** `~/.config/nvim/`

### Core Keymaps

**File:** `~/.config/nvim/lua/config/keymaps.lua`

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Normal | `Esc` | Clear search highlights | Remove search highlighting |
| Normal | `<leader>q` | Open diagnostic quickfix | Open diagnostics in quickfix list |
| Terminal | `Esc Esc` | Exit terminal mode | Return to normal mode from terminal |
| Normal | `↑ ↓ ← →` | Disabled | Reminders to use hjkl |
| Normal | `Ctrl + H` | Focus left window | Move focus to left split |
| Normal | `Ctrl + L` | Focus right window | Move focus to right split |
| Normal | `Ctrl + J` | Focus lower window | Move focus to lower split |
| Normal | `Ctrl + K` | Focus upper window | Move focus to upper split |
| Normal | `Ctrl + A` | Select all | Select entire file |

### Telescope (Fuzzy Finder)

**File:** `~/.config/nvim/lua/plugins/telescope.lua`

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sh` | Search help | Search help documentation |
| `<leader>sk` | Search keymaps | Search all keymaps |
| `<leader>sf` | Search files | Find files in project |
| `<leader>ss` | Search select | Select Telescope picker |
| `<leader>sw` | Search word | Search for word under cursor |
| `<leader>sg` | Search grep | Live grep in project |
| `<leader>sd` | Search diagnostics | Search LSP diagnostics |
| `<leader>sr` | Search resume | Resume previous search |
| `<leader>s.` | Search recent | Search recently opened files |
| `<leader><leader>` | Find buffers | List open buffers |
| `<leader>/` | Fuzzy search buffer | Search in current buffer |
| `<leader>s/` | Search in open files | Live grep in open files |
| `<leader>sn` | Search Neovim config | Find files in Neovim config directory |

### Neo-tree (File Explorer)

**File:** `~/.config/nvim/lua/plugins/neo-tree.lua`

**Global Keybindings:**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>e` | Toggle Neo-tree | Show/hide file explorer |
| `<leader>o` | Focus Neo-tree | Focus on file explorer |

**Neo-tree Window Keybindings:**

| Key | Action | Description |
|-----|--------|-------------|
| `Enter` / `l` | Open | Open file or expand directory |
| `Esc` | Cancel | Close Neo-tree |
| `h` | Close node | Collapse directory |
| `P` | Toggle preview | Show/hide file preview |
| `a` | Add | Create new file/directory |
| `d` | Delete | Delete file/directory |
| `r` | Rename | Rename file/directory |
| `y` | Copy | Copy to clipboard |
| `x` | Cut | Cut to clipboard |
| `p` | Paste | Paste from clipboard |
| `c` | Copy | Copy file/directory |
| `m` | Move | Move file/directory |
| `H` | Toggle hidden | Show/hide hidden files |
| `R` | Refresh | Refresh file tree |
| `?` | Show help | Display help |
| `/` | Fuzzy finder | Fuzzy search files |
| `f` | Filter | Filter files |
| `Ctrl + X` | Clear filter | Clear active filter |
| `s` | Split | Open in horizontal split |
| `v` | Vertical split | Open in vertical split |
| `t` | New tab | Open in new tab |

### LSP (Language Server)

**File:** `~/.config/nvim/lua/plugins/lsp.lua`

These keybindings are available when LSP is attached to a buffer:

| Key | Action | Description |
|-----|--------|-------------|
| `grn` | Rename symbol | Rename symbol under cursor |
| `gra` | Code action | Show available code actions |
| `grr` | Find references | Show all references |
| `gri` | Go to implementation | Jump to implementation |
| `grd` | Go to definition | Jump to definition |
| `grD` | Go to declaration | Jump to declaration |
| `gO` | Document symbols | Show document symbols |
| `gW` | Workspace symbols | Show workspace symbols |
| `grt` | Type definition | Go to type definition |
| `<leader>th` | Toggle inlay hints | Toggle LSP inlay hints |

### Bufferline (Buffer Management)

**File:** `~/.config/nvim/lua/plugins/bufferline.lua`

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>x` | Close buffer | Close current buffer (smart close) |
| `<leader>X` | Close other buffers | Close all buffers except current |
| `Tab` | Next buffer | Cycle to next buffer |
| `Shift + Tab` | Previous buffer | Cycle to previous buffer |

### Blink.cmp (Completion)

**File:** `~/.config/nvim/lua/plugins/completion.lua`

Uses the `default` preset. Common keybindings include:
- `Ctrl + Space` - Trigger completion
- `Ctrl + N` / `Ctrl + P` - Navigate completion menu
- `Enter` - Confirm selection
- `Ctrl + E` - Close completion menu

### Autopairs (Auto-closing Brackets)

**File:** `~/.config/nvim/lua/plugins/autopairs.lua`

**Automatic Behavior:**
- Typing `{`, `(`, `[`, `"`, `'`, or `` ` `` automatically inserts the closing pair
- Pressing `Enter` between pairs creates a new line with proper indentation
  ```
  {
      <cursor here>
  }
  ```
- Pressing `Backspace` between empty pairs deletes both characters

**Override Keybindings (Insert Mode):**

Hold `Ctrl` while typing to insert brackets without auto-closing:

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl + {` | Insert `{` only | Insert opening brace without auto-pair |
| `Ctrl + }` | Insert `}` only | Insert closing brace without auto-pair |
| `Ctrl + (` | Insert `(` only | Insert opening paren without auto-pair |
| `Ctrl + )` | Insert `)` only | Insert closing paren without auto-pair |
| `Ctrl + [` | Insert `[` only | Insert opening bracket without auto-pair |
| `Ctrl + ]` | Insert `]` only | Insert closing bracket without auto-pair |
| `Ctrl + "` | Insert `"` only | Insert double quote without auto-pair |
| `Ctrl + '` | Insert `'` only | Insert single quote without auto-pair |
| `Ctrl + `` ` `` | Insert `` ` `` only | Insert backtick without auto-pair |

### Mini.nvim (Surround)

**File:** `~/.config/nvim/lua/plugins/ui.lua`

Default `mini.surround` keybindings:
- `sa` - Add surrounding (e.g., `saiw"` to surround word with quotes)
- `sd` - Delete surrounding (e.g., `sd"` to delete surrounding quotes)
- `sr` - Replace surrounding (e.g., `sr"'` to replace `"` with `'`)
- `sf` - Find surrounding (to right)
- `sF` - Find surrounding (to left)
- `sh` - Highlight surrounding
- `sn` - Update n lines (config)

### Oil.nvim (File Explorer)

**File:** `~/.config/nvim/lua/plugins/oil.lua`

| Key | Action | Description |
|-----|--------|-------------|
| `-` | Open parent directory | Open oil.nvim in current window |
| `<leader>o` | Open oil floating window | Open oil.nvim in floating window |

**Oil.nvim Window Keybindings:**
- `Enter` - Open file or directory
- `g?` - Show help
- `-` - Go to parent directory
- `_` - Open current working directory
- `` ` `` - Toggle hidden files
- `g.` - Toggle hidden files
- `g\\` - Toggle trash
- And more (use `g?` in oil window for full list)

---

## Notes

- **Leader key** in Neovim is `Space` (set in `~/.config/nvim/lua/config/options.lua`)
- **Which-key** plugin shows available keybindings when you pause after pressing a key
- Some terminal emulators may not support all Ctrl+Shift combinations
- AeroSpace keybindings only work when AeroSpace is running
- Karabiner remappings are system-wide and apply to all applications

---

## Managing This Repository

I use a bare git repository to manage my dotfiles. Here are some useful commands:

```bash
# Alias for easier management (add to ~/.zshrc)
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Check status
dotfiles status

# Add a file
dotfiles add .config/nvim/init.lua

# Commit changes
dotfiles commit -m "Update nvim config"

# Push to GitHub
dotfiles push
```

---

## Installation Requirements

### Core Tools
- [Homebrew](https://brew.sh/) - Package manager for macOS
- [Git](https://git-scm.com/) - Version control

### Applications
```bash
# Window manager
brew install --cask aerospace

# Keyboard customization
brew install --cask karabiner-elements

# Terminal & Shell
brew install tmux
brew install zsh

# Editor
brew install neovim

# Git UI
brew install lazygit
```

### Neovim Dependencies
The Neovim configuration will automatically install plugins via lazy.nvim on first launch. Required tools:
- Node.js (for LSP servers)
- Ripgrep (for Telescope grep)
- A Nerd Font (for icons)

```bash
brew install node ripgrep
brew install --cask font-jetbrains-mono-nerd-font
```

---

**Last Updated:** 2025-12-10 (Fixed oil.nvim configuration, added oil.nvim keybindings)
**Auto-generated from config files**
