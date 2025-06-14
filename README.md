# Neovim configuration
[![Lint](https://github.com/BKHZ/nvim/actions/workflows/lint.yml/badge.svg?branch=main)](https://github.com/BKHZ/nvim/actions/workflows/lint.yml)

![image](https://github.com/user-attachments/assets/dc476306-28bb-4735-abcd-693b44bd33b7)

Plugins are managed via `lazy.nvim` and will automatically synchronize on nvim launch. LSP providers are managed via
`mason`. Autocompletion is provided by `cmp`.

## Dependencies

### ArchLinux

> [!NOTE]
> A patched nerd font is required to correctly display icons

```
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
	bat \
	git-delta \
	ttf-cascadia-code-nerd \
	wl-clipboard
```

## Setup

Clone the repository under `~/.config/nvim`:
```
$ git clone git@github.com:BKHZ/nvim.git ~/.config/nvim
```

Create development plugins directory:
```
$ mkdir -p ~/src/BKHZ/nvim/plugins
```

Install and update plugins:
```
:Lazy
```

Install and update language servers:
```
:Mason
```
