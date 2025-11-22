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
- [Neovim (Text Editor)](#neovim-text-editor)
  - [Core Keymaps](#core-keymaps)
  - [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
  - [Neo-tree (File Explorer)](#neo-tree-file-explorer)
  - [LSP (Language Server)](#lsp-language-server)
  - [Bufferline (Buffer Management)](#bufferline-buffer-management)
  - [Blink.cmp (Completion)](#blinkcmp-completion)
  - [Mini.nvim (Surround)](#minivim-surround)

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

**Last Updated:** 2025-11-21
**Auto-generated from config files**
