return {
	"petertriho/nvim-scrollbar",
	config = function()
		require("scrollbar").setup {
			show = true,
			show_in_active_only = true,
			set_highlights = true,
			hide_if_all_visible = false,
		}
	end
}
