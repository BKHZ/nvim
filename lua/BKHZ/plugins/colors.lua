return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("catppuccin").setup {
                flavour = "mocha",
                transparent_background = false,
                show_end_of_buffer = true,
                term_colors = true,
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.35,
                },
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    barbar = true,
                    treesitter = true,
                    nvimtree = false,
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    mini = {
                        enabled = false,
                    },
                    fidget = true,
                    leap = true,
                    mason = true,
                    neotest = true,
                    telescope = {
                        enabled = true,
                    },
                    lsp_trouble = true,
                    illuminate = {
                        enabled = true,
                        lsp = true,
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "bold" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                        },
                        underlines = {
                            errors = { "undercurl" },
                            hints = { "underdotted" },
                            warnings = { "underdashed" },
                            information = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                },
                -- Overwrite custom highlights in theme for nvim-cmp completion window.
                custom_highlights = function ()
                    return {
                        PmenuSel = { bg = "#282C34", fg = "NONE" },
                        Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

                        CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", strikethrough = true },
                        CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
                        CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
                        CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic = true },

                        CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
                        CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
                        CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

                        CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
                        CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
                        CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

                        CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
                        CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
                        CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

                        CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
                        CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
                        CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
                        CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
                        CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

                        CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
                        CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

                        CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
                        CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
                        CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

                        CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
                        CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
                        CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

                        CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
                        CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
                        CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
                    }
                end
            }

            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = false,
        config = function ()
            require("gruvbox").setup {
                terminal_colors = true,
                undercurl = true,
                underline = true,
            }
        end
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        config = function ()
            ---@diagnostic disable-next-line: missing-fields
            require("tokyonight").setup {
                style = "storm",
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = false },
                    sidebars = "dark",
                    floats = "dark"
                }
            }
        end
    },
}
