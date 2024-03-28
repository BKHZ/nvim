return {
    "romgrk/barbar.nvim",
    -- This plugin is disabled
    enabled = false,
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    config = function ()
        require("barbar").setup {
            animation = true,
            auto_hide = false,
            tabpages = true,
            clickable = false,
        }

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
        vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
    end
}
