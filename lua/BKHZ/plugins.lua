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

require("lazy").setup({
	spec = "BKHZ.lazy",
	change_detection = {
		notify = false,
	},
})
