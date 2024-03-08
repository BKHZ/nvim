-- Remap leader to spacebar
vim.g.mapleader = " "

-- Open netrw browser
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Diagnostics
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

-- Yank visually selected text to the system clipboard.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Yank text to the end of the line to the system clipboard.
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- LSP reformat current buffer
vim.keymap.set("n", "<leader>T", vim.lsp.buf.format)

-- Check keymap definition(s) for a given keymap.
vim.keymap.set("n", "<leader>v", function()
	vim.cmd(":verbose map " .. vim.fn.input("find keymap: "))
end)

-- Unmap arrow keys
local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
