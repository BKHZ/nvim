return {
    "gelguy/wilder.nvim",
    enabled = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local wilder = require("wilder")
        wilder.setup {
            modes = {
                ":", "/", "?",
            },
        }

        wilder.set_option("renderer", wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlighter = wilder.basic_highlighter(),
            left = {' ', wilder.popupmenu_devicons()},
            right = {' ', wilder.popupmenu_scrollbar()},
            -- Make popup transparent
            pumblend = 30,
            min_width = '100%',
            min_height = '30%',
            max_height = '30%',
            reverse = 0,
        })
        ))
    end
}
