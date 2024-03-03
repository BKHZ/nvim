return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		"echasnovski/mini.indentscope",
	},
	config = function()
		require("ibl").setup {
			indent = {
				char = "│",
			},
			scope = {
				-- Disable scope guides
				enabled = false,
			}
		}

		local indentscope = require("mini.indentscope")
		indentscope.setup {
			draw = {
				-- Disable annoying animations
				animation = indentscope.gen_animation.none(),
			},
			options = {
				try_as_border = true,
			},
			symbol = "│",
		}
	end
}
