return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"folke/neodev.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require("mason").setup {
			max_concurrent_installers = 4,
			ui = {
				check_outdated_packages_on_open = true
			}
		}

		-- Neodev setup must be before lspconfig
		require("neodev").setup {
			lspconfig = true,
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
				-- Default LSP server handler
				function(server)
					require("lspconfig")[server].setup {
						capabilities = capabilities
					}
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" }
								}
							}
						}
					}
				end,
			}
		}

		cmp.setup {
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
			}, {
				{ name = "buffer" },
			}),

			-- Autocompletion key mappings
			mapping = cmp.mapping.preset.insert({
				-- Enter key confirms completion item
				["<CR>"] = cmp.mapping.confirm({select = false}),
				-- Ctrl + space triggers completion menu
				["<C-Space>"] = cmp.mapping.complete(),
			})
		}

		-- Diagnostics styling
		vim.diagnostic.config {
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			}
		}
	end
}
