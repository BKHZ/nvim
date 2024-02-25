vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- Packer manages itself
	use "wbthomason/packer.nvim"

	use {
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use({
		"folke/tokyonight.nvim", config = function()
			vim.cmd("colorscheme tokyonight")
		end
	})

	use{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		end
	}

    -- Git magic
	use("tpope/vim-fugitive")

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
end)
