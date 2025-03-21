return {
    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("kanagawa").setup({
                compile = false,
                undercurl = true,
                transparent = false,
                commentStyle = {},
                functionStyle = {},
                keywordStyle = {},
                statementStyle = {},
                typeStyle = {},
                dimInactive = false,
                terminalColors = true,
                theme = "wave",
                background = {
                    dark = "wave",
                },
                ---@diagnostic disable-next-line: unused-local
                overrides = function(colors)
                    local theme = colors.theme
                    local makeDiagnosticColor = function(color)
                        local c = require("kanagawa.lib.color")
                        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                    end

                    return {
                        -- Transparent floating windows
                        NormalFloat = { bg = "none" },
                        FloatBorder = { bg = "none" },
                        FloatTitle = { bg = "none" },
                        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        -- Dark completion popup menu
                        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
                        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar = { bg = theme.ui.bg_m1 },
                        PmenuThumb = { bg = theme.ui.bg_p2 },
                        -- Tinted diagnostic backgrounds
                        DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                        DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                        DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                    }
                end,
                colors = {
                    theme = {
                        all = {
                            ui = {
                                bg_gutter = "none"
                            }
                        }
                    }
                },
            })

            vim.cmd("colorscheme kanagawa")
        end
    },
    {
        "EdenEast/nightfox.nvim",
        enabled = false,
        lazy = false,
        config = function()
            require("nightfox").setup {
                options = {
                    transparent = false,
                    modules = {
                        diagnostic = {
                            enable = true,
                        },
                        native_lsp = {
                            enable = true,
                        },
                        treesitter = true,
                        barbar = false,
                        cmp = true,
                        fidget = true,
                        gitgutter = true,
                        gitsigns = true,
                        illuminate = true,
                        indent_blankline = true,
                        lazy = true,
                        leap = {
                            enable = true,
                            background = false,
                            harsh = true,
                        },
                        modes = true,
                        neotest = true,
                        notify = true,
                        telescope = true,
                    },
                }
            };

            vim.cmd("colorscheme carbonfox")
        end
    },
}
