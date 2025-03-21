return {
    "petertriho/nvim-scrollbar",
    enabled = true,
    dependencies = {
        "rebelot/kanagawa.nvim"
    },
    config = function ()
        local colors = require("kanagawa.colors").setup()

        require("scrollbar").setup {
            show = true,
            show_in_active_only = false,
            set_highlights = true,
            hide_if_all_visible = false,
            throttle_ms = 100,
            folds = 1000,
            handle = {
                color = colors.palette.waveAqua1,

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
