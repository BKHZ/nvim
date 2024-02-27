return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup {
			signcolumn = true,
			numhl = false,
			linehl = false,
			-- Inline blame info
			current_line_blame = false,
		}
	end
}
