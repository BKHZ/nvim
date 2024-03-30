return {
    {
        "rafaelsq/nvim-goc.lua",
        description = "Go coverage as virtual text",
        enabled = false,
        config = function ()
            local goc = require("nvim-goc")
            goc.setup {
                verticalSplit = false,
            }
        end
    }
}
