return {
    "m4xshen/autoclose.nvim",
    enabled = true,
    config = function ()
        require("autoclose").setup {
            auto_indent = true,
            disabled_filetypes = {
                "text",
            },
        }
    end,
}
