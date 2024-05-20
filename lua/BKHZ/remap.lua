-- Keymaps for internal nvim behaviors.
-- Plugin specific mappings are in each individual plugins dropin configuration file.

-- Remap leader to spacebar
vim.g.mapleader = " "

-- Open netrw browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Yank visually selected text to the system clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Yank text to the end of the line to the system clipboard.
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Check keymap definition(s) for a given keymap.
vim.keymap.set("n", "<leader>v", function ()
    vim.cmd(":verbose map " .. vim.fn.input("find keymap: "))
end)

-- Unmap arrow keys
local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

-- Movement hard mode
vim.api.nvim_set_keymap("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Up>", msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Down>", msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Left>", msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Right>", msg, { noremap = true, silent = false })

-- Buffer management
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>Q", ":bp\\|bd \\#<Enter>")
