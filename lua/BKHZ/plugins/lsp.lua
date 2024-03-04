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
		-- Ghost text highlighting
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

		local cmp = require("cmp")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local lspconfig = require("lspconfig")

		local capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		cmp_nvim_lsp.default_capabilities())

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
			-- These are the language servers that we want automatically installed.
			ensure_installed = {
				"gopls",
				"golangci_lint_ls",
				"rust_analyzer",
				"clangd",
				"elixirls",
				"tsserver",
				"eslint",
				"kotlin_language_server",
				"yamlls",
				"lua_ls",
				"ansiblels",
				"bashls",
				"crystalline",
				"dockerls",
				-- "nimls",
				"spectral",
				-- "psalm",
				"zls",
			},

			handlers = {
				-- Default handler
				-- Any LSP server not explicitly defined will use this handler with the default capabilities.
				-- Custom LSP overrides can be different per language; check the LSP servers help to ensure the correct
				-- properties are used.
				function(server)
					lspconfig[server].setup {
						capabilities = capabilities,
					}
				end,

				-- Go handler
				-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md
				["gopls"] = function()
					lspconfig.gopls.setup {
						capabilities = capabilities,
						settings = {
							gopls = {
								analyses = {
									unusedparams = true,
								},
								staticcheck = true,
								gofumpt = true,
							}
						}
					}
				end,

				-- Lua handler
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

				-- C++ handler
				["clangd"] = function()
					lspconfig.clangd.setup {
						capabilities = capabilities,
						filetypes = {
							"c", "cpp", "proto",
						},
					}
				end,
			}
		}

		local cmp_defaults = require("cmp.config.default")()

		-- Completion
		cmp.setup {
			-- CMP snippets
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			-- CMP window
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered()
			},

			-- CMP sources
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "luasnip" },
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "buffer" },
			}),

			-- CMP formatting
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					item.menu = entry:get_completion_item().detail
					return item
				end,
			},

			-- CMP completion
			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			-- CMP key maps
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
      			["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			}),

			-- CMP experiments
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},

			sorting = cmp_defaults.sorting,
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
		--vim.api.nvim_create_autocmd("BufWritePre", {
		--	---@diagnostic disable-next-line: undefined-global
		--	buffer = buffer,
		--	callback = function()
		--		vim.lsp.buf.format {
		--			async = true,
		--		}
		--	end
		--})

		-- LSP auto-formatting for Go.
		-- This will automatically sort imports.
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				local params = vim.lsp.util.make_range_params()
				params.context = { only = { "source.organizeImports" } }
				-- buf_request_sync defaults to a 1000ms timeout. Depending on your
				-- machine and codebase, you may want longer. Add an additional
				-- argument after params if you find that you have to write the file
				-- twice for changes to be saved.
				-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
				local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
				for cid, res in pairs(result or {}) do
					for _, r in pairs(res.result or {}) do
						if r.edit then
							local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
							vim.lsp.util.apply_workspace_edit(r.edit, enc)
						end
					end
				end
				vim.lsp.buf.format({ async = false })
			end
		})
	end
}
