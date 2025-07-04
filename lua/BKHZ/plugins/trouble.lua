return {
    "folke/trouble.nvim",
    enabled = true,
    dependencies = {
        "echasnovski/mini.icons"
    },
    opts = {},
    config = function ()
        local trouble = require("trouble")
        ---@diagnostic disable-next-line: missing-fields
        trouble.setup {
            modes = {
                test = {
                    mode = "diagnostics",
                    preview = {
                        type = "split",
                        relative = "win",
                        position = "right",
                        size = 0.3,
                    },
                },
                diagnostics = {
                    -- Automatically open list when diagnostics are detected
                    auto_open = true,
                    -- Automatically close list when no diagnostics are detected
                    auto_close = false,
                    auto_preview = true,
                    auto_refresh = true,
                    -- Do not auto focus window when items added
                    focus = false,
                    indent_guides = true,
                    multiline = true,
                    max_items = 200,
                    -- Group results scoped by filename.
                    group = true,
                },
            },
        }

        vim.keymap.set("n", "<leader>xx", function () trouble.toggle("diagnostics") end)
        vim.keymap.set("n", "<leader>xl", function () trouble.toggle("loclist") end)
        vim.keymap.set("n", "<leader>xq", function () trouble.toggle("quickfix") end)
    end
}
