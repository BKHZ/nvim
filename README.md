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
	neovim-lspconfig \
	diff-so-fancy \
	ripgrep \
	otf-monaspace \
	otf-monaspace-nerd \
	wl-clipboard
```

> [!NOTE]
> A patched nerd font is required to correctly display icons in various plugins that rely on `nvim-web-devicons`.

## Setup

Clone the repository under `~/.config/nvim`:
```bash
$ git clone git@github.com:BKHZ/nvim.git ~/.config/nvim
```

Start neovim:
```bash
$ nvim
```

Install and update plugins:
```bash
:Lazy
```

Install and update language servers:
```bash
:Mason
```
