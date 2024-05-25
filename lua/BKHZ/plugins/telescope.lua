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
        local builtin = require("telescope.builtin")

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
                        -- Delete buffer from picker float.
                        ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                    },
                    n = {
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
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

        -- File picker
        vim.keymap.set("n", "<leader>f", function ()
            builtin.find_files {
                previewer = true,
                hidden = true,
                file_ignore_patterns = {
                    -- VCS source directories
                    ".git/",
                    -- Go packages
                    "vendor/",
                    -- JS packages
                    "node_modules/",
                    -- Vim files
                    "*~",
                    "*.swp",
                    "*.swo",
                }
            }
        end, {})

        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        -- Search file contents (ripgrep)
        vim.keymap.set("n", "<leader>F", builtin.live_grep, {})

        -- Interactive keyword search
        vim.keymap.set("n", "<leader>ps", function ()
            builtin.grep_string({ search = vim.fn.input("cwd search > ") });
        end)

        -- List buffers
        vim.keymap.set("n", "<leader>b", builtin.buffers, {})

        -- Registers
        vim.keymap.set("n", "<leader>r", builtin.registers, {})

        -- Open telescope to neovim configuration directory.
        -- Autocmd must start with upper case letter.
        vim.api.nvim_create_user_command("Config", function ()
            builtin.find_files({cwd="~/.config/nvim"})
        end, {})
    end
}
