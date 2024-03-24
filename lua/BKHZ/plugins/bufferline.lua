return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = {
		"VeryLazy",
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
	},
	config = function()
		require("bufferline").setup{
			highlights = {
				buffer_selected = {
					bold = false,
					italic = false,
				}
			},
			options = {
				mode = "buffers",
				separator_style = "slant",
				show_buffer_icons = true,
				show_tab_indicators = true,
				show_close_icon = false,
				show_buffer_close_icons = false,
				always_show_bufferline = false,
				indicator = {
					style = "underline",
				},
			},
		}
	end
}
