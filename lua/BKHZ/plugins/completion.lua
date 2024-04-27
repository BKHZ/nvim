return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- Completition actions
        -- Requires `diff-so-fancy` to be installed globally.
        "aznhe21/actions-preview.nvim",
        "nvim-telescope/telescope.nvim",
        -- Luasnip snippets
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    config = function ()
        -- Ghost text highlighting
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

        local cmp = require("cmp")
        local cmp_defaults = require("cmp.config.default")()
        local preview = require("actions-preview")

        local has_words_before = function ()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        preview.setup {
            diff = {
                algorithm = "patience",
                ignore_whitespace = true,
                ctxlen = 3,
            },
            highlight_command = {
                require("actions-preview.highlight").diff_so_fancy(),
            },
            telescope = vim.tbl_extend(
                "force",
                require("telescope.themes").get_dropdown(),
                {
                    make_value = nil,
                    make_make_display = nil,
                }
            ),
        }

        vim.keymap.set({"v", "n"}, "<leader>a", preview.code_actions)

        cmp.setup {
            -- Skip automatically selecting the first item
            preselect = "None",

            snippet = {
                expand = function (args)
                    require("luasnip").lsp_expand(args.body) -- Luasnip snippets
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                ["<C-CR>"] = function (fallback)
                    cmp.abort()
                    fallback()
                end,
                ["<Tab>"] = cmp.mapping(function (fallback)
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
                -- File paths
                { name = "path" },
                -- Language server
                { name = "nvim_lsp",               keyword_length = 3 },
                -- Function signatures
                { name = "nvim_lsp_signature_help" },
                -- Complete neovims Lua runtime API (vim.lsp.*)
                { name = "nvim_lua",               keyword_length = 2 },
                -- Source current buffer
                { name = "buffer",                 keyword_length = 2 },
                -- nvim-cmp source for luasnip
                { name = "luasnip",                keyword_length = 2 },
            }),

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },

            formatting = {
                expandable_indicator = true,
                -- fields = { "kind", "abbr", "menu" },
                fields = { "menu", "kind", "abbr" },
                format = function (entry, item)
                    -- item.menu = entry:get_completion_item().detail
                    -- return item

                    local menu_icon = {
                        nvim_lsp = "λ",
                        luasnip = "⋗",
                        buffer = "Ω",
                        path = "🖫",
                    }

                    item.menu = menu_icon[entry.source.name]
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
