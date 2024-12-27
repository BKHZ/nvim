return {
    "ggandor/leap.nvim",
    enabled = true,
    config = function (_, opts)
        local leap = require("leap")
        for k, v in pairs(opts) do
            leap.opts[k] = v
        end

        leap.add_default_mappings(true)

        vim.keymap.del({ "x", "o" }, "x")
        vim.keymap.del({ "x", "o" }, "X")

        vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
    end
}
