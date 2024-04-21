local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Automatically install lazy.nvim if it isnt setup
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("BKHZ.plugins", {
    change_detection = {
        notify = false,
    },
    install = {
        -- Don't install missing plugins on startup
        missing = false,
    },
    checker = {
        enabled = true,
        -- Slow down plugin checks
        concurrency = 3,
        -- Check for updates every 4 hours
        frequency = 14400,
        -- Dont notify on neovim start
        notify = false,
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
                "tutor",
                "tohtml",
            },
        },
    },
})
