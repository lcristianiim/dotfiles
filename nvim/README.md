# Neovim Configuration

Modern Neovim config using lazy.nvim plugin manager. Converted from legacy vim config (NeoBundle) on 2026-05-13.

## Installation

### Quick Install
```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# Copy this config
cp -r ~/projects/dotfiles/nvim/* ~/.config/nvim/

# Start nvim (lazy.nvim auto-installs)
nvim
```

### Manual Install
```bash
# Create config directory
mkdir -p ~/.config/nvim/lua/plugins

# Copy files
cp ~/projects/dotfiles/nvim/init.lua ~/.config/nvim/
cp ~/projects/dotfiles/nvim/lua/plugins/init.lua ~/.config/nvim/lua/plugins/
```

## First Run

1. Open nvim — lazy.nvim will auto-install
2. Wait for plugin installation to complete
3. Run `:TSInstall lua vim javascript typescript html css json markdown` for Treesitter parsers
4. Run `:Lazy` to see plugin status

## Structure

```
~/.config/nvim/
├── init.lua              # Main config + lazy.nvim bootstrap
└── lua/
    └── plugins/
        └── init.lua      # Plugin specifications
```

## Keybindings

| Key | Action |
|-----|--------|
| `<Leader>e` | Toggle file explorer (neo-tree) |
| `<Leader>f` | Find files (telescope) |
| `<Leader>g` | Live grep (telescope) |
| `<Leader>b` | List buffers |
| `<Leader>rtw` | Remove trailing whitespace |
| `<C-Right>` | Next tab |
| `<C-Left>` | Previous tab |
| `<C-t>` | New tab |
| `<C-h/j/k/l>` | Navigate splits (tmux-aware) |
| `<F10>` | Toggle paste mode |
| `<F12>` | Open terminal |

## Plugins

| Plugin | Purpose |
|--------|---------|
| tokyonight.nvim | Color scheme |
| neo-tree.nvim | File explorer (NERDTree replacement) |
| telescope.nvim | Fuzzy finder (CtrlP replacement) |
| emmet-vim | HTML/CSS abbreviations |
| vim-polyglot | Syntax support |
| LuaSnip | Snippets |
| gitsigns.nvim | Git signs in gutter |
| lualine.nvim | Status line |
| nvim-autopairs | Auto-close brackets |
| Comment.nvim | Comment with gc |
| which-key.nvim | Keybinding help |
| nvim-treesitter | Modern syntax highlighting |

## Customization

### Change colorscheme
Edit `lua/plugins/init.lua`, replace `tokyonight` with any supported theme:
- `catppuccin`
- `nord`
- `gruvbox`
- `dracula`
- etc.

### Add plugins
Add to `lua/plugins/init.lua`:
```lua
{
  "author/plugin-name",
  config = function()
    -- plugin config
  end,
}
```

## Legacy Config

Old vim config backed up at: `~/.config/nvim/init.vim.backup`

Used NeoBundle (deprecated since ~2015). Migrated to lazy.nvim (modern, actively maintained).

---

## AI Context

When the user asks about this config:
- Config location: `~/projects/dotfiles/nvim/`
- Deploy location: `~/.config/nvim/`
- Plugin manager: lazy.nvim
- Bootstrap: Auto-installs on first run
- Treesitter parsers need manual install: `:TSInstall <languages>`

If user wants to add plugins:
1. Edit `lua/plugins/init.lua`
2. Add plugin spec (see lazy.nvim docs)
3. Run `:Lazy sync`

If user reports errors:
1. Check if plugins installed: `:Lazy`
2. Check if Treesitter parsers installed: `:TSInstallInfo`
3. Check health: `:checkhealth`

Common fixes:
- `E117: Unknown function` → Plugin not installed, run `:Lazy sync`
- `module not found` → Same as above
- Treesitter errors → Run `:TSInstall <language>`