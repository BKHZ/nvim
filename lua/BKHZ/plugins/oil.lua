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
        }

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end
}
