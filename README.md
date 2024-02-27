<div align="center">
	<h1>
		<picture>
			<img alt="Neovim" src=".assets/neovim-logo.png">
		</picture>
	</h1>
</div>

# Neovimrc

Plugins are managed via `lazy.nvim` and will automatically synchronize on nvim launch. LSP providers are managed via
mason.

## Setup

### Prerequisites

#### Clipboard

If you want copy paste support from/into buffers, you will need a clipboard tool installed:

ArchLinux (Wayland/X11):
```bash
$ pacman -S wl-clipboard xclip xsel
```

Mac OS X:
```bash
$ brew install pbcopy pbpaste
```

### Installation

Clone the repository under `~/.config/nvim`:
```bash
$ git clone git@github.com:BKHZ/neovimrc.git ~/.config/nvim
```

Start neovim:
```bash
$ nvim
```

## License

This project is licensed under the [MIT License](LICENSE).
