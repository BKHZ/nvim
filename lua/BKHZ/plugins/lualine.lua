return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "tpope/vim-fugitive",
        "folke/trouble.nvim",
        "folke/lazy.nvim",
    },

    config = function ()
        local status = require("lazy.status")
        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = 'powerline',
                component_separators = '',
                section_separators = '',
                globalstatus = false,
            },
            sections = {
                lualine_a = {
                    { "mode" },
                },
                lualine_b = {
                    { "branch" },
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        colored = true,
                        always_visible = false,
                    },
                },
                lualine_c = {
                    {
                        "filename",
                        path = 4,
                    }
                },
                lualine_x = {
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                    {
                        status.updates,
                        cond = status.has_updates,
                        color = { fg = "#ff9e64" }
                    },
                },
                lualine_y = {
                    { "progress" }
                },
                lualine_z = {
                    { "location" },
                }
            },
            extensions = {
                "fugitive",
                "trouble",
            },
        }
    end
}
