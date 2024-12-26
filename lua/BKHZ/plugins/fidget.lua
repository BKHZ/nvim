return {
    "j-hui/fidget.nvim",
    enabled = true,
    config = function ()
        require("fidget").setup {
            progress = {
                ignore_done_already = false,
                ignore_empty_message = false,
                display = {
                    render_limit = 16,
                    -- How long messages should stay visible after completion
                    done_ttl = 5,
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
                window = {
                    border = "none",
                    relative = "editor",
                    winblend = 30,
                    x_padding = 1,
                    y_padding = 1,
                },
            },
        }
    end
}
