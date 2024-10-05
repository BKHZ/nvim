return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    dependencies = {
        { "echasnovski/mini.indentscope", version = "*" },
    },
    config = function ()
        require("ibl").setup {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = {
                -- Disable scope guides
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                }
            }
        }

        local indentscope = require("mini.indentscope")
        indentscope.setup {
            draw = {
                animation = indentscope.gen_animation.exponential(),
            },
            options = {
                -- Cursor on method to define block scope
                try_as_border = true,
                -- Use row reference instead of column when calculating the block level
                indent_at_cursor = false,
            },
            symbol = "│",
        }
    end
}
