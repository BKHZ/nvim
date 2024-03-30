return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim",
    },
    event = {
        "VeryLazy",
    },
    after = "catppuccin",
    config = function ()
        local palette = require("catppuccin.palettes").get_palette "macchiato"
        require("bufferline").setup {
            highlights = require("catppuccin.groups.integrations.bufferline").get {
                styles = { "italic", "bold" },
                custom = {
                    macchiato = {
                        background = { fg = palette.text },
                    },
                }
            },
            options = {
                mode = "buffers",
                separator_style = "slope",
                show_buffer_icons = true,
                show_tab_indicators = true,
                show_close_icon = false,
                show_buffer_close_icons = false,
                always_show_bufferline = true,
                indicator = {
                    style = "underline",
                },
                color_icons = true,
                hover = {
                    enabled = false,
                }
            },
        }

        vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
        vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
    end
}
