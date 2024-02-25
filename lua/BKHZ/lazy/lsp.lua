return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		local default_setup = function(server)
			require("lspconfig")[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		require("mason").setup {
			max_concurrent_installers = 4,
			ui = {
				check_outdated_packages_on_open = true
			}
		}

		require("mason-lspconfig").setup {
			automatic_installation = false,
			ensure_installed = {
				"tsserver",
				"eslint",
				"rust_analyzer",
				"gopls",
				"golangci_lint_ls",
				"kotlin_language_server",
				"yamlls",
				"lua_ls",
			},
			handlers = {
				default_setup,
			}
		}

		local cmp = require("cmp")
		cmp.setup {
			sources = {
				{ name = "nvim_lsp" },
			},
			mapping = cmp.mapping.preset.insert({
				-- Enter key confirms completion item
				["<CR>"] = cmp.mapping.confirm({select = false}),
				-- Ctrl + space triggers completion menu
				["<C-Space>"] = cmp.mapping.complete(),
			})
		}
	end
}
