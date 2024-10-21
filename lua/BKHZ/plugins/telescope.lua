return {
    "nvim-telescope/telescope.nvim",
    enabled = true,
    branch = "0.1.x",
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
    },

    config = function ()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local open_with_trouble = require("trouble.sources.telescope").open

        -- Create the horizontal fused layout strategy
        local layout_strategies = require("telescope.pickers.layout_strategies")
        layout_strategies.horizontal_fused = function(picker, max_columns, max_lines, layout_config)
            local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
            layout.prompt.title = ""
            layout.results.title = ""
            layout.preview.title = ""
            layout.results.height = layout.results.height + 1
            layout.results.borderchars = { "─", "│", "─", "│", "╭", "┬", "┤", "├" }
            layout.preview.borderchars = { "─", "│", "─", " ", "─", "╮", "╯", "─" }
            layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "┴", "╰" }
            return layout
        end

        telescope.setup {
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown {}
                }
            },
            defaults = {
                previewer = true,
                hidden = true,
                prompt_prefix = " > ",
                initial_mode = "insert",
                theme = "center",
                path_display = { "filename_first" },
                sorting_strategy = "ascending",
                layout_strategy = "horizontal_fused",
                layout_config = {
                    horizontal = {
                        prompt_position = "bottom",
                        preview_width = 0.6,
                    },
                },
                color_devicons = true,
                winblend = 0,
                border = {},
                mappings = {
                    i = {
                        ["<C-t>"] = open_with_trouble,
                        -- Delete buffer from picker float.
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
