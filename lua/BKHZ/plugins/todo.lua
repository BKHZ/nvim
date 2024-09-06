return {
    "folke/todo-comments.nvim",
    enabled = true,
    config = function ()
        require("todo-comments").setup {
            signs = true,
            highlight = {
                -- Multiline support for comments
                multiline = true
            },
            search = {
                commands = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column"
                }
            }
        }
    end
}
