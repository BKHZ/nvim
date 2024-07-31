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
