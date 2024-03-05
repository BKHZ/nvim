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
