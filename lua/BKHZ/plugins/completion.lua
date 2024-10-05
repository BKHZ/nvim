return {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",

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
        -- Icons
        "onsails/lspkind.nvim"
    },

    config = function ()
        -- Ghost text highlighting
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

        local cmp = require("cmp")
        local cmp_defaults = require("cmp.config.default")()
        local preview = require("actions-preview")
        local lspkind = require("lspkind")

        local has_words_before = function ()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        -- Setup code actions preview plugin
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

        -- Setup CMP plugin
        cmp.setup {
            -- Skip automatically selecting the first item
            -- preselect = "None",

            snippet = {
                expand = function (args)
                    -- Use luasnip snippets
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
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
                -- { name = "path" },
                -- Language server
                { name = "nvim_lsp",               keyword_length = 3 },
                -- Function signatures
                { name = "nvim_lsp_signature_help" },
                -- Complete neovims Lua runtime API (vim.lsp.*)
                { name = "nvim_lua",               keyword_length = 2 },
                -- Source current buffer
                -- { name = "buffer",                 keyword_length = 2 },
                -- nvim-cmp source for luasnip
                { name = "luasnip",                keyword_length = 2 },
            }),

            window = {
                -- completion = cmp.config.window.bordered(),
                completion = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    col_offset = -3,
                    side_padding = 0,
                },
                documentation = cmp.config.window.bordered()
            },

            -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu
            -- Better looking completion window.
            formatting = {
                fields = { "kind", "abbr", "menu" },
                expandable_indicator = true,
                format = function(entry, vim_item)
                    local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"
                    return kind
                end,
            },

            -- Completeopt can mess with correctly showing the most accurate completion result.
            -- completion = {
            --     completeopt = "menu,menuone,noinsert",
            -- },

            experimental = {
                ghost_text = {
                    hl_group = "CmpGhostText",
                },
            },

            sorting = cmp_defaults.sorting,
        }
    end,
}
