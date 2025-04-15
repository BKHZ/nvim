return {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    dependencies = {
        "zbirenbaum/copilot-cmp",
    },
    opts = {
        panel = {
            enabled = false,
        },
        suggestion = {
            enabled = true,
            auto_trigger = false,
            keymap = {
                accept = false, -- handled by nvim-cmp
                accept_word = '<M-w>',
                accept_line = '<M-l>',
                next = '<M-]>',
                prev = '<M-[>',
                dismiss = '/',
            },
        },
        filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            go = true,
            typescript = true,
            rust = true,
            cpp = true,
            ["."] = false,
        }
    },
    config = function(_, opts)
        local cmp = require('cmp')
        local copilot = require('copilot.suggestion')
        local luasnip = require('luasnip')

        require('copilot').setup(opts)
        require('copilot_cmp').setup {}

        local function set_trigger(trigger)
            vim.b.copilot_suggestion_auto_trigger = trigger
            vim.b.copilot_suggestion_hidden = not trigger
        end

        -- Hide suggestions when the completion menu is open.
        cmp.event:on('menu_opened', function()
            if copilot.is_visible() then
                copilot.dismiss()
            end
            set_trigger(false)
        end)

        -- Disable suggestions when inside a snippet.
        cmp.event:on('menu_closed', function()
            set_trigger(not luasnip.expand_or_locally_jumpable())
        end)
        vim.api.nvim_create_autocmd('User', {
            pattern = { 'LuasnipInsertNodeEnter', 'LuasnipInsertNodeLeave' },
            callback = function()
                set_trigger(not luasnip.expand_or_locally_jumpable())
            end,
        })

        vim.keymap.set("n", "<leader>cpe", ":Copilot enable<cr>", { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>cpd", ":Copilot disable<cr>", { silent = true, noremap = true })
    end
}
