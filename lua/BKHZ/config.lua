local config = {
	-- Allow copying to wayland clipboard
	-- clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	fileencoding = "utf-8",
	-- Keep multiple buffers
	hidden = true,
	-- Auto-completion time
	updatetime = 1000,
	-- Enable GUI colors
	termguicolors = true,
	-- Disable backup files
	backup = false,
	writebackup = false,
	guicursor = "",
	-- Relative line numbering
	number = true,
	relativenumber = true,
	-- Tab settings
	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	-- Ignore case sensitivity in search
	ignorecase = true,
	-- Do not convert tabs to spaces
	expandtab = false,
	-- Try to do smart indentation
	smartindent = true,
	hlsearch = true,
	incsearch = true,
	scrolloff = 8,
	sidescrolloff = 8,
	-- Always show the sign columns to avoid unnecessary text movement
	signcolumn = "yes",
	-- Rulers
	colorcolumn = "120",
	-- Highlight current line
	cursorline = true,
	-- Set number column width
	numberwidth = 4,
	-- Disable modeline
	showmode = false,
	-- Persistent undos
	undofile = true,
	-- Always show tabs
	showtabline = 2,
	-- Dont line wrap long lines
	wrap = false,
}

for k, v in pairs(config) do
	vim.opt[k] = v
end

-- Hide intro screen
vim.opt.shortmess:append "I"

-- Netrw sizing
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 45

-- Always enable editorconfig
vim.g.editorconfig = true
