return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		-- Luasnip snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- Snippy snippets
		-- "dcampos/nvim-snippy",
		-- "dcampos/cmp-snippy",
	},

	config = function()
		-- Ghost text highlighting
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

		local cmp = require("cmp")
		local cmp_defaults = require("cmp.config.default")()

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup {
			-- Skip automatically selecting the first item
			preselect = "None",

			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- Luasnip snippets
					-- require("snippy").expand_snippet(args.body) -- Snippy snippets
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered()
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
      			["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace,select = true}),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" })
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				-- { name = "snippy" }, -- Snippy snippet source
				{ name = "luasnip" }, -- Luasnip snippet source
				{ name = "nvim_lsp_signature_help" },
			}, {
				{ name = "buffer" },
			}),

			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					item.menu = entry:get_completion_item().detail
					return item
				end,
			},

			completion = {
				completeopt = "menu,menuone,noinsert",
			},

			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},

			sorting = cmp_defaults.sorting,
		}
	end,
}
