# Neovim configuration

Plugins are managed via `lazy.nvim` and will automatically synchronize on nvim launch. LSP providers are managed via
`mason`. Autocompletion is provided by `cmp`.

## Packages

Install NeoVim:

### Arch Linux

```bash
$ sudo pacman -S neovim \
	neovim-lspconfig
```

Install the below optional system packages:

### ArchLinux

```bash
$ sudo pacman -S ttf-cascadia-code \
	ttf-cascadia-code \
	ttf-cascadia-mono-nerd \
	diff-so-fancy \
	ripgrep \
	wl-clipboard \
	xclip \
	xsel
```

A patched nerd font is required to correctly display icons in various plugins that rely on `nvim-web-devicons`. The
`ripgrep` package provides ultra fast file search and indexing support. If you are running Wayland instead of X11, you
can omit installing the `xclip` and `xsel` packages, otherwise omit `wl-clipboard`.

## Setup

Clone the repository under `~/.config/nvim`:
```bash
$ git clone git@github.com:BKHZ/nvimrc.git ~/.config/nvim
```

Create optional legacy vim symlink in your PATH:
```bash
$ ln -fs /usr/bin/nvim /usr/local/bin/vim
```

Start neovim:
```bash
$ nvim
```

Install and update plugins:
```bash
:Lazy install
:Lazy update
```

Install and update language servers:
```bash
:Mason
```

## Plugins
- [Autoclose](https://github.com/m4xshen/autoclose.nvim)
- [Barbecue](https://github.com/utilyre/barbecue.nvim)
- [Bufferline](https://github.com/akinsho/bufferline.nvim)
- [Catpuccin](https://github.com/catppuccin/nvim)
- [Commentary](https://github.com/tpope/vim-commentary)
- [CMP](https://github.com/hrsh7th/nvim-cmp)
- [GOC](https://github.com/rafaelsq/nvim-goc.lua)
- [Fidget](https://github.com/j-hui/fidget.nvim)
- [Fugitive](https://github.com/tpope/vim-fugitive)
- [Git signs](https://github.com/lewis6991/gitsigns.nvim)
- [Illuminate](https://github.com/RRethy/vim-illuminate)
- [Indent](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Leap](https://github.com/ggandor/leap.nvim)
- [LSP Config](https://github.com/neovim/nvim-lspconfig)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [Neoscroll](https://github.com/karb94/neoscroll.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Todo](https://github.com/folke/todo-comments.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Twilight](https://github.com/folke/twilight.nvim)
- [Wilder](https://github.com/gelguy/wilder.nvim)
- [Zenmode](https://github.com/folke/zen-mode.nvim)
