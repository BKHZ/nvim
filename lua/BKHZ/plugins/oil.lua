return {
    "stevearc/oil.nvim",
    enabled = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
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
                max_width = 100,
                max_height = 40,
                border = "rounded",
                win_options = {
                    winblend = 0,
                }
            }
        }

        -- Open oil in a float.
        vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
    end
}
