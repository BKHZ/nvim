return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
    },

    config = function ()
        local telescope = require("telescope")
        local trouble = require("trouble.providers.telescope")
        local actions = require("telescope.actions")

        telescope.setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                },
            },

            defaults = {
                mappings = {
                    i = {
                        ["<C-t>"] = trouble.open_with_trouble,
                    },
                    n = {
                        ["<C-q"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-t>"] = trouble.open_with_trouble,
                        ["q"] = actions.close,
                    },
                }
            }
        }

        -- Load UI selection extension
        -- This extension allows neovim to use telescope based UI menus for rendering internal windows (i.e. lsp.buf
        -- when autocompleting LSP code actions).
        telescope.load_extension("ui-select")

        local builtin = require("telescope.builtin")

        -- File picker
        vim.keymap.set("n", "<leader>f", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        -- Search file contents (ripgrep)
        vim.keymap.set("n", "<leader>F", builtin.live_grep, {})

        -- Interactive keyword search
        vim.keymap.set("n", "<leader>ps", function ()
            builtin.grep_string({ search = vim.fn.input("cwd search > ") });
        end)

        -- List buffers
        vim.keymap.set("n", "<leader>b", builtin.buffers, {})
    end
}
