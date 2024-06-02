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
	ttc-iosevka \
	ttf-iosevka-nerd \
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
