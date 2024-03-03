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
				-- Cursor on method to define block scope
				try_as_border = true,
				-- Use row reference instead of column when calculating the block level
				indent_at_cursor = false,
			},
			symbol = "│",
		}
	end
}
