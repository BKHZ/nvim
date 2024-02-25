return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup {
			scope = {
				-- Disable scope guides
				enabled = false,
			}
		}
	end
}
