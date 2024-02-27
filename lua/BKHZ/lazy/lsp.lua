return {
	"neovim/nvim-lspconfig",

	event = {
		"InsertEnter",
		"CmdlineEnter",
	},

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"folke/neodev.nvim",
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		-- Mason
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

		-- Mason LSP providers
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
					lspconfig[server].setup {
						capabilities = capabilities,
					}
				end,

				["lua_ls"] = function()
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

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		-- Completion
		cmp.setup {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					item.menu = entry:get_completion_item().detail
					return item
				end
			},

			window = {
				documentation = cmp.config.window.bordered()
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "buffer" },
			}),

			-- Autocompletion key mappings
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
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

		-- LSP automatic formatting on save.
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = buffer,
			callback = function()
				vim.lsp.buf.format { async = false }
			end
		})
	end
}
