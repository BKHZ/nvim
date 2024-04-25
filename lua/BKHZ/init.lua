-- Custom configuration bootstrap.
-- Lazy configuration for plugins are loaded last after all other settings are applied.

require("BKHZ.config")
require("BKHZ.remap")
require("BKHZ.netrw")
require("BKHZ.lazy")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local BKHZGroup = augroup("BKHZ", {})

-- Remove trailing whitespace at the end of all lines in the active buffer.
autocmd({"BufWritePre"}, {
    group = BKHZGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
