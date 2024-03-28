return {
    "tpope/vim-fugitive",
    config = function ()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local BKHZ_Fugitive = vim.api.nvim_create_augroup("BKHZ_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = BKHZ_Fugitive,
            pattern = "*",
            callback = function ()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local opts = { buffer = vim.api.nvim_get_current_buf(), remap = false, silent = true }
                vim.keymap.set("n", "<leader>P", function ()
                    vim.cmd.Git("push")
                end, opts)
            end
        })
    end
}
