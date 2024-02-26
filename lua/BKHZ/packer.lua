local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]
return require("packer").startup(function(use)
	-- Packer manages itself
	use "wbthomason/packer.nvim"

	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } }
	}

	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end
	})

	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({
				with_sync = true,
			})
		end
	}

	-- Git magic
	use("tpope/vim-fugitive")

	-- Block comments
	use("tpope/vim-commentary")

	-- LSP plugins
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")

	-- Git gutter symbols
	use("airblade/vim-gitgutter")

	-- Indentation guides
	use("lukas-reineke/indent-blankline.nvim")

	-- Automatically setup packer after clone
	if packer_bootstrap then
		require("packer").sync()
	end
end)
