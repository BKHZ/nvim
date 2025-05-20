return {
    "olimorris/codecompanion.nvim",
    enabled = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        { 'echasnovski/mini.nvim', version = false }
    },
    config = function()
        require("codecompanion").setup {
            adapters = {
                copilot = function()
                    return require("codecompanion.adapters").extend("copilot", {
                        schema = {
                            model = {
                                -- Always show at top of chat buffer
                                order = 1,
                                default = "claude-3.7-sonnet",
                                choices = {
                                    "claude-3.5-sonnet",
                                    "claude-3.7-sonnet",
                                    "claude-3.7-sonnet-thought"
                                }
                            },
                            -- num_ctx = {
                                --     default = 50000
                                -- }
                            }
                    })
                end
            },
            strategies = {
                inline = {
                    keymaps = {
                        accept_change = {
                            modes = { n = "ga" }, description = "Accept the suggested change"
                        },
                        reject_change = {
                            modes = { n = "gr" }, description = "Reject the suggested change"
                        }
                    }
                },
                chat = {
                    roles = {
                        --@type string|fun(adapter: CodeCompanion.Adapter): string
                        llm = function (adapter)
                            return adapter.formatted_name .. " (Response)"
                        end,

                        -- Name of user for message responses
                        user = "BKHZ"
                    }
                }
            },
            opts = {
                language = "English",
                -- System prompt sent with every LLM request.
                -- This is commented out to use the default CodeCompanion prompt:
                -- https://codecompanion.olimorris.dev/configuration/system-prompt.html
                --
                --@diagnostic disable-next-line: unused-local
                -- system_prompt = function (opts)
                --     return ""
                -- end,
                strategies = {
                    chat = {
                        adapter = "copilot"
                    },
                    inline = {
                        adapter = "copilot"
                    }
                }
            },
            display = {
                diff = {
                    enabled = true,
                    layout = "vertical",
                    provider = "mini_diff" -- or "default"
                },
                chat = {
                    -- Disable auto response stream scrolling
                    auto_scroll = true,
                    intro_message = "How can I help? (Press ? for options)",
                    show_header_separator = false,
                    show_references = true,
                    -- Show LLM settings at top of chat buffer
                    show_settings = true,
                    show_token_count = true,
                    start_in_insert_mode = false,
                    window = {
                        layout = "vertical",
                        position = "right",
                        border = "single",
                        relative = "editor",
                        full_height = true,
                        width = 0.25,
                        opts = {
                            breakindent = true,
                            wrap = true,
                            cursorcolumn = false,
                            cursorline = false,
                            signcolumn = "no"
                        }
                    },
                    action_pallete = {
                        prompt = "Prompt",
                        provider = "telescope",
                        opts = {
                            show_default_actions = true,
                            show_default_prompt_library = true
                        }
                    },

                    -- Customize how tokens are displayed
                    -- @param tokens number
                    -- @param adapter CodeCompanion.Adapter
                    -- @return string
                    ---@diagnostic disable-next-line: unused-local
                    token_count = function (tokens, _)
                        return " (" .. tokens .. " tokens)"
                    end
                }
            }
        }

        -- Toggle code companion panel
        vim.keymap.set("n", "<leader>cc", ":CodeCompanionChat Toggle<cr>", { silent = true, noremap = true })
        -- Auto-expand cc to CodeCompanion
        vim.cmd([[cab cc CodeCompanion]])
    end,
}
