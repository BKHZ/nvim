return {
	"petertriho/nvim-scrollbar",
	config = function()
		local colors = require("tokyonight.colors").setup()
		require("scrollbar").setup {
			show = true,
			show_in_active_only = true,
			set_highlights = true,
			hide_if_all_visible = false,
			handle = {
				color = colors.bg_highlight,
			},
			marks = {
				Search = { color = colors.orange },
				Error = { color = colors.error },
				Warn = { color = colors.warning },
				Info = { color = colors.info },
				Hint = { color = colors.hint },
				Misc = { color = colors.purple },
			}
		}
	end
}
