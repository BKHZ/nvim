return {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    config = function ()
        require("gitsigns").setup {
            -- Show status symbols in column
            signcolumn = true,
            -- Dont change number colors to match status
            numhl = false,
            -- Dont change line highlighting to match status
            linehl = false,
            -- Inline blame info
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
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
