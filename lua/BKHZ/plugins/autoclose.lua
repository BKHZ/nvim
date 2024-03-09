return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup {
			auto_indent = true,
			disabled_filetypes = {
				"text",
			},
		}
	end,
}
