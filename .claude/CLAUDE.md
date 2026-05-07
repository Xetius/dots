# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a dotfiles repository for a development environment centered on Neovim, Tmux, and Zsh. Files are symlinked to the home directory using GNU Stow.

## Commands

```bash
# Install all dependencies from Brewfile
brew bundle install

# Symlink dotfiles to home directory
cd ~/dotfiles && stow .

# Reload zsh configuration
source ~/.zshrc
```

## Architecture

### Neovim Configuration (`.config/nvim/`)

The Neovim setup uses **lazy.nvim** as the plugin manager with modular configuration:

- `init.lua` - Entry point that loads all config modules
- `lua/config/` - Core settings:
  - `options.lua` - Editor options (2-space indentation, relative line numbers, system clipboard)
  - `keymaps.lua` - All keybindings organized by plugin/feature
  - `lazy.lua` - Plugin manager bootstrap
  - `colorscheme.lua` - Gruvbox Material dark theme
- `lua/plugins/` - Individual plugin configurations (one file per plugin or feature group)

**LSP Stack:**
- Mason manages LSP server installation
- blink.cmp for completions with LuaSnip snippets
- Configured servers: lua_ls, rust_analyzer, gopls, yamlls, terraformls, bashls

**Key Navigation Plugins:**
- Telescope (fuzzy finding): `<leader>f*` commands
- Harpoon2 (quick file marks): `<leader>h*` and `Alt+1-5`
- Oil.nvim (file browser): `<leader>e`
- vim-tmux-navigator: `Ctrl+hjkl` moves between Vim splits and Tmux panes

### Shell Configuration (`.config/zsh/`)

- `aliases` - Shell aliases for common tools (eza, kubectl, terraform, git)
- Zsh with zplug plugin manager
- oh-my-posh prompt

### Tmux (`.config/tmux/tmux.conf`)

Tmux with plugins managed via TPM, integrates with vim-tmux-navigator for seamless pane switching.

## Key Patterns

- **Leader key**: Space
- **Formatting**: conform.nvim with LSP fallback, runs on save
- **Diagnostics**: Trouble.nvim via `<leader>x*` keybindings
- **Claude integration**: claudecode.nvim plugin with `<leader>a*` keybindings
