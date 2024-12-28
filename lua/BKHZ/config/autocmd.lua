-- Auto commands

local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
    return vim.api.nvim_create_augroup("BKHZ_" .. name, { clear = true })
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

-- Override closing some filetypes with <q>
autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "help",
        "lspinfo",
        "notify",
        "qf",
        "neotest-output",
        "neotest-summary",
        "neotest-output-panel",
        "checkhealth",
        "gitsigns.blame",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", {
            buffer = event.buf,
            silent = true,
            desc = "Quit buffer",
        })
    end
})

-- Skip adding man pages to buffer list when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})
