return {
	"folke/trouble.nvim",
	dependencies = {
		"folke/trouble.nvim",
	},

	config = function()
		require("trouble").setup {
			icons = false,
			position = "bottom",
			mode = "workspace_diagnostics",
			-- Group results on a per-file basis.
			group = true,
		}
	end
}
