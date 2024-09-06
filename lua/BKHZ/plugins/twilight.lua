return {
    "folke/twilight.nvim",
    enabled = true,
    dependencies = {
        "folke/zen-mode.nvim",
    },
    config = function ()
        require("twilight").setup {
            -- Number of surrounding lines to show normally
            context = 15,
            treesitter = true,
            dimming = {
                -- Dimming amount
                alpha = 0.25,
                -- Don't dim inactive windows'
                inactive = false,
            }
        }
    end
}
