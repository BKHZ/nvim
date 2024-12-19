return {
    {
        "EdenEast/nightfox.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("nightfox").setup {
                options = {
                    modules = {
                        diagnostic = {
                            enable = true,
                        },
                        native_lsp = {
                            enable = true,
                        },
                        treesitter = true,
                        barbar = true,
                        cmp = true,
                        fidget = true,
                        gitgutter = true,
                        gitsigns = true,
                        illuminate = true,
                        indent_blankline = true,
                        lazy = true,
                        leap = {
                            enable = true,
                            background = false,
                            harsh = true,
                        },
                        modes = true,
                        neotest = true,
                        notify = true,
                        telescope = true,
                    },
                }
            };

            vim.cmd("colorscheme carbonfox")
        end
    },
}
