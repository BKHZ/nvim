-- Editor configuration options.

local config = {
    -- Allow copying to wayland clipboard
    -- clipboard = "unnamedplus",
    cmdheight = 1,
    completeopt = { "menuone", "noselect" },
    fileencoding = "utf-8",
    -- Keep multiple buffers
    hidden = true,
    -- Auto-completion time
    updatetime = 100,
    -- Enable GUI colors
    termguicolors = true,
    -- Disable backup files
    backup = false,
    writebackup = false,
    guicursor = {
        "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
        "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
        "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
    },
    -- Relative line numbering
    number = true,
    relativenumber = true,
    -- Tab settings
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    -- Ignore case sensitivity in search
    ignorecase = true,
    -- Do not convert tabs to spaces
    expandtab = false,
    -- Try to do smart indentation
    smartindent = true,
    hlsearch = true,
    incsearch = true,
    scrolloff = 8,
    sidescrolloff = 8,
    -- Always show the sign columns to avoid unnecessary text movement
    signcolumn = "yes",
    -- Soft max line length
    colorcolumn = "120",
    -- Highlight current line
    cursorline = true,
    -- Set number column width
    numberwidth = 4,
    -- Disable modeline
    showmode = false,
    -- Persistent undos
    undofile = true,
    -- Disable tabline
    showtabline = 0,
    -- Dont line wrap long lines
    wrap = false,
    -- Round indent
    shiftround = true
}

for k, v in pairs(config) do
    vim.opt[k] = v
end

-- Hide intro screen
vim.opt.shortmess:append "I"

-- Always enable editorconfig
vim.g.editorconfig = true

vim.diagnostic.config({
    -- Show inline error messages
    virtual_text = true,
})
