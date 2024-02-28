return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"tpope/vim-fugitive",
		"folke/trouble.nvim",
	},

	config = function()
		require("lualine").setup {
			icons_enabled = true,
			theme = "auto",
			-- Show a separate status bar per window
			globalstatus = false,
			extensions = {
				"fugitive",
				"trouble",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch" },
					{ "diff" },
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						colored = true,
						always_visible = false,
					},
				},
				lualine_c = {
					{
						"filename",
						-- Filename and parent dir, with tilde as the home directory
						path = 4,
					}
				},
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
			},
		}
	end
}
