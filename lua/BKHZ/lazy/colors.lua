return {
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup {
				style = "storm",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark"
				}
			}

			vim.cmd("colorscheme tokyonight-storm")
		end
	},
}
