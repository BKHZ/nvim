return {
    "folke/trouble.nvim",
    config = function ()
        local trouble = require("trouble")
        trouble.setup {
            icons = true,
            position = "bottom",
            mode = "workspace_diagnostics",
            -- Group results on a per-file basis.
            group = true,
            cycle_results = true,
            -- Show all severity levels
            severity = nil,
            padding = true,
            -- Automatically open list when diagnostics are detected
            auto_open = true,
            -- Automatically close list when no diagnostics are detected
            auto_close = false,
            -- Mappings for keymaps in the diagnostics window
            action_keys = {
                close = "q",
                refresh = "r",
                switch_severity = "s",
                preview = "p",
                previous = "k",
                next = "j",
                -- Opens a small popup with the full diagnostic message
                hover = "K",
            },
            multiline = true,
        }

        vim.keymap.set("n", "<leader>xx", function () trouble.toggle() end)
        vim.keymap.set("n", "<leader>xX", function () trouble.toggle("workspace_diagnostics") end)
        vim.keymap.set("n", "<leader>xL", function () trouble.toggle("loclist") end)
        vim.keymap.set("n", "<leader>xQ", function () trouble.toggle("quickfix") end)
    end
}
