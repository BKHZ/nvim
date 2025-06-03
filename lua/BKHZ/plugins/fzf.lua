return {
    "ibhagwan/fzf-lua",
    enabled = true,
    dependencies = {
        "echasnovski/mini.icons"
    },
    config = function ()
        local fzf = require("fzf-lua")
        local actions = require("fzf-lua").actions

        fzf.setup {
            defaults = {
                file_icons = "mini",
            },
            previewers = {
                builtin = {
                    syntax = true,
                    treesitter = {
                        enabled = true,
                        disabled = {
                            "md",
                        }
                    }
                }
            },
            winopts = {
                border = "rounded",
                backdrop = 70,
                title_pos = "center",
                title_flags = false,
                fullscreen = false,
                treesitter = {
                    enabled = true
                },
                preview = {
                    default = "builtin",
                    hidden = false,
                    wrap = true,
                    scrollbar = false,
                    winopts = {
                        number = true,
                        cursorline = false,
                        relativenumber = false,
                        signcolumn = "no"
                    }
                },
                -- Keymaps upon creation of FZF window
                on_create = function ()
                end
            },
            actions = {
                files = {
                    ["enter"] = actions.file_edit_or_qf,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["alt-q"] = actions.file_sel_to_qf,
                    ["alt-Q"] = actions.file_sel_to_ll,
                    ["alt-i"] = actions.toggle_ignore,
                    ["alt-h"] = actions.toggle_hidden,
                    ["alt-f"] = actions.toggle_follow,
                }
            },
            fzf_opts = {
                ["--ansi"] = true,
                ["--border"] = "none",
                ["--highlight-line"] = true
            },
            fzf_colors = {
                true,
            },
            codeaction_native = {
                diff_opts = { ctxlen = 3 },
                -- git-delta is automatically detected as pager, set `pager=false`
                -- to disable, can also be set under 'lsp.code_actions.preview_pager'
                pager = [[delta --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]]
            },
            files = {
                git_icons              = true,
                file_icons             = "mini",
                color_icons            = true,
                formatter              = "path.filename_first",
                cmd                    = "rg --files",
                find_opts              = [[-type f \! -path '*/.git/*']],
                rg_opts                = [[--color=never --hidden --files -g "!.git"]],
                fd_opts                = [[--color=never --hidden --type f --type l --exclude .git]],
                dir_opts               = [[/s/b/a:-d]],
                cwd_prompt             = true,
                cwd_prompt_shorten_len = 32,
                hidden                 = true,
                no_ignore              = false
            }
        }

        -- File picker
        vim.keymap.set("n", "<leader>f", function ()
            fzf.files {}
        end, { desc = "Find files" })

        -- Search file contents
        vim.keymap.set("n", "<leader>g", fzf.grep, { desc = "Search for pattern" })

        -- Interactive keyword search
        vim.keymap.set("n", "<leader>F", fzf.live_grep, { desc = "Live grep for pattern" })

        -- Buffer list
        vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "List buffers" })

        -- Open neovim configuration
        vim.api.nvim_create_user_command("Config", function ()
            fzf.files { cwd = "~/.config/nvim" }
        end, {})
    end
}
