return {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    config = function ()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            -- https://github.com/nvim-treesitter/nvim-treesitter
            ensure_installed = {
                "bash",
                "comment",
                "typescript",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "c",
                "cpp",
                "rust",
                "make",
                "dockerfile",
                "scala",
                "lua",
                "luadoc",
                "vim",
                "vimdoc",
                "query",
                "toml",
                "yaml",
                "json",
                "gdscript",
                "gdshader",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "fish",
                "css",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            ident = {
                enable = true,
            },

            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            },

            highlight = {
                enable = true,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
        })

        local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        ---@diagnostic disable-next-line: inject-field
        treesitter_parser_config.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-templ.git",
                files = { "src/parser.c", "src/scanner.c" },
                branch = "master",
            },
        }

        vim.treesitter.language.register("templ", "templ")
    end
}
