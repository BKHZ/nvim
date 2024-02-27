return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
	},

	config = function()
		local trouble = require("trouble.providers.telescope")
		require("telescope").setup {
			defaults = {
				mappings = {
					i = { ["<c-t>"] = trouble.open_with_trouble },
					n = { ["<c-t>"] = trouble.open_with_trouble },
				}
			}
		}

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})

		-- General search
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("grep > ") });
		end)

		-- Ripgrep live search
		vim.keymap.set("n", "<leader>F", builtin.live_grep, {})

		-- List buffers
		vim.keymap.set("n", "<leader>b", builtin.buffers, {})
	end
}
