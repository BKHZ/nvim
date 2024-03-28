return {
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup {
			progress = {
				ignore_done_already = false,
				ignore_empty_message = false,
				display = {
					progress_icon = {
						pattern = "dots",
						period = 1,
					},
				},
			},
			notification = {
				view = {
					stack_upwards = true,
				},
				window = {
					border = "none",
					winblend = 0,
					x_padding = 3,
					y_padding = 1,
				},
			},
		}
	end
}
