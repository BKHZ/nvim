return {
    {
        "catppuccin/nvim",
        enabled = true,
        lazy = false,
        config = function ()
            require("catppuccin").setup {
                flavour = "mocha",
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = true,
                dim_inactive = {
                    enabled = false,
                },
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                },
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    fidget = true,
                    leap = true,
                    markdown = true,
                    mason = true,
                    neotest = true,
                    copilot_vim = true,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    telescope = {
                        enabled = true,
                    },
                    lsp_trouble = true,
                    gitgutter = true,
                    mini = {
                        enabled = true,
                        base = true,
                        statusline = true,
                    }
                },
            }

            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "AlexvZyl/nordic.nvim",
        enabled = false,
        lazy = false,
        config = function ()
            require("nordic").setup {
                bold_keywords = true,
                italic_comments = true,
                bright_border = true,
                reduced_blue = false
            }

            vim.cmd.colorscheme("nordic")
        end
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = false,
        lazy = false,
        config = function ()
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
                theme = "dragon",
                background = {
                    dark = "dragon",
                },
                ---@diagnostic disable-next-line: unused-local
                overrides = function (colors)
                    local theme = colors.theme
                    local makeDiagnosticColor = function (color)
                        local c = require("kanagawa.lib.color")
                        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                    end

                    return {
                        -- Transparent floating windows
                        NormalFloat                = { bg = "none" },
                        FloatBorder                = { bg = "none" },
                        FloatTitle                 = { bg = "none" },
                        NormalDark                 = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                        LazyNormal                 = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        MasonNormal                = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                        -- Dark completion popup menu
                        Pmenu                      = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
                        PmenuSel                   = { fg = "NONE", bg = theme.ui.bg_p2 },
                        PmenuSbar                  = { bg = theme.ui.bg_m1 },
                        PmenuThumb                 = { bg = theme.ui.bg_p2 },
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

            vim.cmd.colorscheme("kanagawa")
        end
    },
    {
        "EdenEast/nightfox.nvim",
        enabled = false,
        lazy = false,
        config = function ()
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

            vim.cmd.colorscheme("carbonfox")
        end
    },
}
