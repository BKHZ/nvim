return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        require("oil").setup {
            -- Takeover default netrw explorer
            default_file_explorer = false,
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
                max_width = 200,
                max_height = 50,
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
