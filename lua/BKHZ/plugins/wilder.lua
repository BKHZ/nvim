return {
    "gelguy/wilder.nvim",
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
                -- Make popup transparent
                pumblend = 20,
                highlighter = wilder.basic_highlighter(),
                left = { " ", wilder.popupmenu_devicons() },
                right = { " ", wilder.popupmenu_scrollbar() },
                min_width = "100%",
                min_height = "50%",
                reverse = 0,
            })
        ))
    end
}
