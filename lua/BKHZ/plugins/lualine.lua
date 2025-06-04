return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "echasnovski/mini.icons",
        "tpope/vim-fugitive",
        "folke/trouble.nvim",
        "folke/lazy.nvim",
        "catppuccin/nvim",
    },

    config = function ()
        local status = require("lazy.status")
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = "catppuccin",
                component_separators = "",
                section_separators = "",
                globalstatus = false,
            },
            sections = {
                lualine_a = {
                    { "mode" },
                },
                lualine_b = {
                    { "branch" },
                },
                lualine_c = {
                    { "diagnostics", sources = { "nvim_lsp" }, colored = true, always_visible = false },
                    { "filename",    path = 4 }
                },
                lualine_x = {
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                    { status.updates, cond = status.has_updates, color = { fg = "#ff9e64" } },
                },
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 1 } }
                },
                lualine_z = {
                    { "location", padding = { left = 0, right = 1 } },
                }
            },
            extensions = {
                "fugitive",
                "trouble",
                "lazy",
                "fzf"
            },
        }
    end
}
