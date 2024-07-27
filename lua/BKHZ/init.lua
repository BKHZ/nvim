-- Custom configuration bootstrap.
-- Lazy configuration for plugins are loaded last after all other settings are applied.

require("BKHZ.config.options")
require("BKHZ.config.keymaps")
require("BKHZ.config.netrw")
require("BKHZ.config.lazy")

local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
    return vim.api.nvim_create_augroup("BKHZ_" .. name, { clear = true})
end

-- Remove trailing whitespace at the end of all lines in the active buffer.
autocmd({"BufWritePre"}, {
    group = augroup("trailing_whitespace"),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Resize splits if window got resized
autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
