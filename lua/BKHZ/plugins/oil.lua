return {
    "stevearc/oil.nvim",
    config = function ()
        require("oil").setup {
            -- Takeover default netrw explorer
            default_file_explorer = false,
            columns = {
                "icon",
                "permissions",
                "size",
            },
        }
    end
}
