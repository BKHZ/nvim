return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")
		trouble.setup {
			icons = false,
			position = "bottom",
			mode = "workspace_diagnostics",
			-- Group results on a per-file basis.
			group = true,
		}

		vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
		vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
	end
}
