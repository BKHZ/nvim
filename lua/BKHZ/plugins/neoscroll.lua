return {
    "karb94/neoscroll.nvim",
    config = function()
        require("neoscroll").setup {
            hide_cursor = true,
            stop_eof = true,
            easing_function = "quadratic",
        }
    end
}
