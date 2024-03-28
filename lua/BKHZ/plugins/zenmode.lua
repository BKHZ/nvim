return {
    "folke/zen-mode.nvim",
    config = function ()
        local zenmode = require("zen-mode")
        zenmode.setup {
            window = {
                width = 120,
                height = 1,
            },
            alacritty = {
                enabled = true,
            },
            plugins = {
                -- Automatically enable twilight when entering zenmode.
                twilight = {
                    enabled = true,
                }
            }
        }

        vim.keymap.set("n", "<leader>zz", function ()
            zenmode.toggle()
        end)
    end
}
