-- Keymaps for internal nvim behaviors.
-- Plugin specific mappings are in each individual plugins dropin configuration file.

local map = vim.api.nvim_set_keymap

-- Remap leader to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
map("i", "<Up>", "<C-o>" .. msg, { noremap = true, silent = false })
map("i", "<Down>", "<C-o>" .. msg, { noremap = true, silent = false })
map("i", "<Left>", "<C-o>" .. msg, { noremap = true, silent = false })
map("i", "<Right>", "<C-o>" .. msg, { noremap = true, silent = false })
map("n", "<Up>", msg, { noremap = true, silent = false })
map("n", "<Down>", msg, { noremap = true, silent = false })
map("n", "<Left>", msg, { noremap = true, silent = false })
map("n", "<Right>", msg, { noremap = true, silent = false })

-- Buffer management
vim.keymap.set("n", "<leader>q", ":bdelete<CR>")
vim.keymap.set("n", "<leader>Q", ":bp\\|bd \\#<Enter>")
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Move to windows using <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", noremap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", noremap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", noremap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", noremap = true })

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

