# Neovim configuration

Plugins are managed via `lazy.nvim` and will automatically synchronize on nvim launch. LSP providers are managed via
`mason`. Autocompletion is provided by `cmp`.

## Packages (optional)

Install the below optional system packages:

### ArchLinux

```bash
$ sudo pacman -S ttf-cascadia-code \
	ttf-cascadia-mono-nerd \
	diff-so-fancy \
	ripgrep \
	wl-clipboard \
	xclip \
	xsel
```

## Installation

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
```

Install and update language servers:
```bash
:Mason
```

## License

This project is licensed under the [MIT License](LICENSE).
