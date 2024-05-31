return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local trouble = require("trouble")
        trouble.setup {
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
        }

        vim.keymap.set("n", "<leader>xx", function () trouble.toggle("diagnostics") end)
        vim.keymap.set("n", "<leader>xl", function () trouble.toggle("loclist") end)
        vim.keymap.set("n", "<leader>xq", function () trouble.toggle("quickfix") end)
    end
}
