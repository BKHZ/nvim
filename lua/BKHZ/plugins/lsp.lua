return {
    "neovim/nvim-lspconfig",
    enabled = true,
    event = {
        "InsertEnter",
        "CmdlineEnter",
    },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
        "j-hui/fidget.nvim",
    },
    config = function ()
        local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local lspconfig = require("lspconfig")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            has_cmp and cmp_nvim_lsp.default_capabilities() or {}
        )

        require("mason").setup {
            max_concurrent_installers = 4,
            ui = {
                check_outdated_packages_on_open = true
            }
        }

        ---@diagnostic disable-next-line: missing-fields
        require("neodev").setup {
            lspconfig = true,
        }

        require("mason-lspconfig").setup {
            automatic_installation = false,
            -- These are the language servers that we want automatically installed.
            ensure_installed = {
                "gopls",
                "templ",
                "golangci_lint_ls",
                "rust_analyzer",
                "clangd",
                "eslint",
                "yamlls",
                "lua_ls",
                "pyright",
                "ansiblels",
                "dockerls",
                "cmake",
                "cssls",
                "taplo",
                "zls",
            },

            handlers = {
                -- Default handler
                function (server_name)
                    lspconfig[server_name].setup {
                        capabilities = capabilities,
                    }
                end,
            }
        }

        -- Templ LSP
        lspconfig.templ.setup {
            capabilities = capabilities,
            filetypes = {
                "templ",
            },
        }

        -- Go LSP
        lspconfig.gopls.setup {
            capabilities = capabilities,
            settings = {
                gopls = {
                    staticcheck = true,
                    gofumpt = true,
                    completeUnimported = true,
                    usePlaceholders = true,
                    semanticTokens = true,
                    analyses = {
                        unusedparams = true,
                        unusedwrite = true,
                        fieldalignment = false,
                        nilness = true,
                        useany = true,
                    },
                    hints = {
                        parameterNames = true,
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        rangeVariableTypes = true,
                    },
                    codelenses = {
                        generate = true,
                        gc_details = true,
                        tidy = true,
                        upgrade_dependency = true,
                        test = true,
                        vendor = true
                    }
                }
            }
        }

        -- GolangCI Lint LSP
        lspconfig.golangci_lint_ls.setup {
            capabilities = capabilities,
            settings = {
                gopls = {
                    gofumpt = true,
                }
            },
            flags = {
                debounce_text_changes = 150,
            }
        }

        -- Rust LSP
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    inlayHints = {
                        chainingHints = true,
                        typeHints = true,
                        parameterHints = true,
                    },
                }
            }
        }

        -- Clang LSP
        lspconfig.clangd.setup {
            capabilities = capabilities,
            filetypes = {
                "c", "cpp", "proto",
            },
        }

        -- Zig LSP
        lspconfig.zls.setup {
            capabilities = capabilities,
        }

        -- Lua LSP
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                    },
                    format = {
                        enable = true,
                    },
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "2",
                    },
                    diagnostics = {
                        globals = { "vim", "it", "describe", "before_each", "after_each" }
                    },
                    telemetry = {
                        enable = false,
                    },
                }
            }
        }

        -- Gdscript LSP
        lspconfig.gdscript.setup {
            capabilities = capabilities,
            cmd = {
                "ncat", "localhost", "6008",
            }
        }

        -- ESLint LSP
        lspconfig.eslint.setup {
            capabilities = capabilities,
        }

        -- LSP keymap shortcuts
        -- Only remap keys after language server has attached to current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function (event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                -- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
                vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
                -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
                -- vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
                -- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
                vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
                vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

                -- Code action picker
                -- Replaced by actions-preview (in completion.lua).
                -- vim.keymap.set("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

                -- LSP reformat current buffer
                vim.keymap.set("n", "<leader>T", vim.lsp.buf.format)
            end,
        })

        -- LSP auto-formatting for Go.
        -- This will automatically sort imports.
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function ()
                local params = vim.lsp.util.make_range_params()
                params.context = { only = { "source.organizeImports" } }
                -- buf_request_sync defaults to a 1000ms timeout. Depending on your
                -- machine and codebase, you may want longer. Add an additional
                -- argument after params if you find that you have to write the file
                -- twice for changes to be saved.
                -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
                for cid, res in pairs(result or {}) do
                    for _, r in pairs(res.result or {}) do
                        if r.edit then
                            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                            vim.lsp.util.apply_workspace_edit(r.edit, enc)
                        end
                    end
                end
                vim.lsp.buf.format({ async = false })
            end
        })
    end
}
