-- Keymaps for internal nvim behaviors.
-- Plugin specific mappings are in each individual plugins dropin configuration file.

local map = vim.api.nvim_set_keymap
local vmap = vim.api.nvim_set_vmap
local keymap = vim.keymap.set

-- Remap leader to spacebar
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Open netrw browser
keymap("n", "<leader>pv", vim.cmd.Ex)

-- Yank visually selected text to the system clipboard.
keymap({ "n", "v" }, "<leader>y", [["+y]])
-- Yank text to the end of the line to the system clipboard.
keymap("n", "<leader>Y", [["+Y]])

-- Check keymap definition(s) for a given keymap.
keymap("n", "<leader>v", function ()
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
keymap("n", "<leader>q", ":bdelete<CR>")
keymap("n", "<leader>Q", ":bp\\|bd \\#<Enter>")
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
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Show TODO comments in telescope picker
map("n", "<leader>o", "<cmd>:TodoTelescope<CR>", {})

-- Remove search highlights
map("n", ",", "<cmd>:noh<cr>", {})

-- Visual indenting
map("v", "<Tab>", ">gv", { desc = "Indent Right" })
map("v", "<S-Tab>", "<gv", { desc = "Indent Left" })
