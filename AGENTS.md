# AGENTS.md

This file provides context for AI agents working with this dotfiles repository.

## Repository Overview

Personal dotfiles for @mwly, managed with [GNU Stow](https://www.gnu.org/software/stow/) on Manjaro Linux.

## Structure

```
.dotfiles/
├── nvim/           # Neovim configuration
├── profile/        # Shell configuration (zsh)
├── alacritty/      # Alacritty terminal emulator
├── starship/       # Starship prompt
└── fonts/          # Custom fonts (ComicMono Nerd Font)
```

## Stow Convention

Each directory mirrors the home directory structure. Install with:
```bash
stow <directory>
```

Example: `nvim/.config/nvim/` symlinks to `~/.config/nvim/`

## Configuration Details

### Neovim (`nvim/.config/nvim/`)

- **Plugin manager**: vim-plug (plugins in `plugged/`)
- **Plugin configs**: `after/plugin/*.lua`
- **Main config**: `init.vim` (vimscript, not Lua)
- **Colorscheme**: Gruvbox (default)
- **LSP**: CoC.nvim
- **Leader key**: Space

Key plugins: Telescope, Harpoon, Fugitive, vim-go, vimtex, Treesitter, Lualine

### Shell (`profile/.zshrc`)

- Base: Manjaro zsh config with oh-my-zsh
- Prompt: Starship (initialized at end of .zshrc)
- Editor: nvim

### Alacritty (`alacritty/.config/alacritty/`)

- Config format: TOML (`alacritty.toml`)
- Font: ComicMono Nerd Font, 12pt
- Opacity: 50% with blur

### Starship (`starship/.config/starship.toml`)

- Theme: Gruvbox colors
- Shows: OS, directory, git, jj (Jujutsu), language versions, time

## Languages & Tools

Primary: Go, Rust, Python, JavaScript/TypeScript, C, LaTeX

The owner uses:
- Git and Jujutsu (jj) for version control
- Makefiles for builds
- VimWiki for notes (`~/vimwiki/`)

## Conventions

- Indentation: 4 spaces
- Spell checking: German (de) for Markdown
- Keybindings: Vim-style, keyboard-driven workflow

## When Making Changes

1. Respect existing style and structure
2. Neovim plugins go in `init.vim` (Plug declarations), configs in `after/plugin/`
3. Use vimscript for `init.vim`, Lua for plugin configs
4. Test with `stow -n <dir>` (dry run) before applying
5. Keep configurations minimal and purposeful
