return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("catppuccin").setup {
                flavour = "macchiato",
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
                },
            }

            vim.cmd.colorscheme("catppuccin")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
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
        config = function ()
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
