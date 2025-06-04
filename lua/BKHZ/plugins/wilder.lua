return {
    "gelguy/wilder.nvim",
    enabled = true,
    dependencies = {
        "echasnovski/mini.icons"
    },
    config = function ()
        local wilder = require("wilder")
        local icons = require("mini.icons").default

        wilder.setup {
            modes = {
                ":", "/", "?",
            },
        }

        local function get_icon(entry)
            local kind = entry.kind or "Default"
            return icons[kind] or ""
        end

        wilder.set_option("renderer", wilder.popupmenu_renderer(
            wilder.popupmenu_border_theme({
                highlighter = wilder.basic_highlighter(),
                highlights = {
                    border = "Normal"
                },
                left = { " ", function (entry)
                    return get_icon(entry) .. " "
                end },
                right = { " ", wilder.popupmenu_scrollbar() },
                -- Make popup transparent
                pumblend = 30,
                min_width = "100%",
                min_height = "50%",
                max_height = "50%",
                reverse = 0,
            })
        ))
    end
}
