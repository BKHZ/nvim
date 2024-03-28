return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require("gitsigns").setup {
            -- Show status symbols in column
            signcolumn = true,
            -- Dont change number colors to match status
            numhl = false,
            -- Dont change line highlighting to match status
            linehl = false,
            -- Inline blame info
            current_line_blame = false,
            signs = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
        }
    end
}
