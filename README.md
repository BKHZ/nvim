# Neovim configuration
[![Lint](https://github.com/BKHZ/nvim/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/BKHZ/nvim/actions/workflows/lint.yml)

![image](https://github.com/user-attachments/assets/dc476306-28bb-4735-abcd-693b44bd33b7)

Plugins are managed via `lazy.nvim` and will automatically synchronize on nvim launch. LSP providers are managed via
`mason`. Autocompletion is provided by `cmp`.

## Packages

Install NeoVim:

### ArchLinux

```bash
$ sudo pacman -S \
	neovim \
	ttf-cascadia-code \
	neovim-lspconfig \
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
$ git clone git@github.com:BKHZ/nvim.git ~/.config/nvim
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
