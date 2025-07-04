return {
    "stevearc/oil.nvim",
    enabled = true,
    dependencies = {
        "echasnovski/mini.icons"
    },
    config = function ()
        require("oil").setup {
            keymaps = {
                ["<Esc>"] = { callback = "actions.close", mode = "n" }
            },
            -- Takeover default netrw explorer
            default_file_explorer = true,
            lsp_file_methods = {
                enabled = true
            },
            columns = {
                "icon",
                "permissions",
                "size",
            },
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = 2,
                max_width = 0,
                min_width = { 40, 0.4 },
                max_height = 0,
                min_height = { 5, 0.1 },
                border = "none",
                win_options = {
                    winblend = 0,
                }
            }
        }

        -- Open oil in a float.
        vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end
}
