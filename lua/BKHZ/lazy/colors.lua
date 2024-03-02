return {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup {
				flavour = "macchiato",
				transparent_background = false,
				show_end_of_buffer = true,
				term_colors = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = false,
					},
				},
			}

			vim.cmd.colorscheme("catppuccin")
		end
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("gruvbox").setup {
				terminal_colors = true,
				undercurl = true,
				underline = true,
			}
		end
	},
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
		end
	},
}
