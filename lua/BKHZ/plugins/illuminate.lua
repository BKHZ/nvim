return {
    "RRethy/vim-illuminate",
    enabled = true,
    config = function ()
        require("illuminate").configure {
            providers = {
                "lsp",
                "treesitter",
            },
            under_cursor = true,
            min_count_to_highlight = 2,
        }
    end
}
