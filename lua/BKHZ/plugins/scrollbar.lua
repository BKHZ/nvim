return {
    "petertriho/nvim-scrollbar",
    enabled = true,
    dependencies = {
        "EdenEast/nightfox.nvim",
        "catppuccin/nvim"
    },
    config = function ()
        local mocha = require("catppuccin.palettes").get_palette "mocha"
        require("scrollbar").setup {
            show = true,
            show_in_active_only = false,
            set_highlights = true,
            hide_if_all_visible = false,
            throttle_ms = 100,
            folds = 1000,
            handle = {
                color = mocha.overlay0,

                blend = 50,
                highlight = "CursorColumn",
                hide_if_all_visible = true,
            },
            handlers = {
                -- Hide the cursor shape
                cursor = false,
                diagnostics = true,
                gitsigns = true,
                handle = true,
                search = false,
            },
        }
    end
}
