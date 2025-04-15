return {
    "akinsho/git-conflict.nvim",
    version = "*",
    enabled = true,
    config = function ()
        require("git-conflict").setup {
            default_mappings = {
                ours = 'o',
                theirs = 't',
                none = '0',
                both = 'b',
                next = 'n',
                prev = 'p',
            },
            default_commands = true,
            disable_dianostics = true,
            highlights = {
                incoming = 'DiffAdd',
                current = 'DiffText'
            }
        }
    end
}
