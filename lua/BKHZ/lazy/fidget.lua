return {
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup {
			progress = {
				ignore_done_already = true,
				ignore_empty_message = true,
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
			},
		}
	end
}
