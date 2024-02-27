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
			},
		}
	end
}
