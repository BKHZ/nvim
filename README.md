# Neovim configuration
[![Lint](https://github.com/BKHZ/nvim/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/BKHZ/nvim/actions/workflows/lint.yml)

![image](https://github.com/user-attachments/assets/dc476306-28bb-4735-abcd-693b44bd33b7)

Plugins are managed via `lazy.nvim` and will automatically synchronize on nvim launch. LSP providers are managed via
`mason`. Autocompletion is provided by `cmp`.

## Dependencies

### ArchLinux

> [!NOTE]
> A patched nerd font is required to correctly display icons in various plugins that rely on `nvim-web-devicons`.

```bash
$ sudo pacman -S \
	git \
	curl \
	unzip \
	tar \
	gzip \
	neovim \
	neovim-lspconfig \
	diff-so-fancy \
	ripgrep \
	ttf-cascadia-code-nerd \
	wl-clipboard
```

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
