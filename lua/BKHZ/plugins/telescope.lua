return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    -- branch = "0.1.x",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
    },

    config = function ()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local themes = require("telescope.themes")
        local open_with_trouble = require("trouble.sources.telescope").open

        telescope.setup {
            -- Apply ivy theme for all pickers
            -- https://github.com/nvim-telescope/telescope.nvim/issues/938#issuecomment-877539724
            defaults = themes.get_ivy {
                previewer = true,
                hidden = false,
                initial_mode = "insert",
                path_display = {
                    -- Show file base name first with remainder path at the end
                    "filename_first",
                },
                sorting_strategy = "ascending",
                color_devicons = true,
                winblend = 20,
                mappings = {
                    i = {
                        ["<C-t>"] = open_with_trouble,
                        ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
                        ["<C-h>"] = "which_key",
                        ["<C-v>"] = actions.select_vertical,
                        ["<C-x>"] = actions.select_horizontal,
                        ["<Esc>"] = actions.close
                    },
                    n = {
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<C-t>"] = open_with_trouble,
                        ["q"] = actions.close,
                    },
                }
            },
            pickers = {
                colorscheme = {
                    enable_preview = true
                },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_ivy {}
                }
            },
        }

        -- Load UI selection extension
        -- This extension allows neovim to use telescope based UI menus for rendering internal windows (i.e. lsp.buf
        -- when autocompleting LSP code actions).
        telescope.load_extension("ui-select")

        -- File picker
        vim.keymap.set("n", "<leader>f", function ()
            builtin.find_files {
                hidden = true,
                file_ignore_patterns = {
                    -- VCS source directories
                    "%.git/",
                    -- Go packages
                    "vendor/",
                    -- JS packages
                    "node_modules/",
                    -- Vim files
                    "*~",
                    "*.swp",
                    "*.swo",
                },
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
