return {
    {
        "neovim/nvim-lspconfig",
        enabled = true,
        event = {
            "InsertEnter",
            "CmdlineEnter",
        },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "j-hui/fidget.nvim",
        },
        config = function ()
            local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            local capabilities = has_cmp and cmp_nvim_lsp.default_capabilities() or
                vim.lsp.protocol.make_client_capabilities()

            require("mason").setup {
                max_concurrent_installers = 4,
                ui = {
                    check_outdated_packages_on_open = true
                }
            }

            require("mason-lspconfig").setup {
                -- Automatically enable language servers when relevant file types are opened.
                automatic_enable = true,
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
                }
            }

            -- Add capabilities to all language servers
            vim.lsp.config("*", {
                capabilities = capabilities
            })

            -- LSP keymap shortcuts
            -- Only remap keys after language server has attached to current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function (event)
                    local bufmap = function (mode, rhs, lhs)
                        vim.keymap.set(mode, rhs, lhs, { buffer = event.buf })
                    end

                    -- Neovim 0.11 default LSP keymaps
                    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
                    bufmap("n", "grr", "<cmd>lua vim.lsp.buf.references()<cr>")
                    bufmap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<cr>")
                    bufmap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<cr>")
                    bufmap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<cr>")
                    bufmap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<cr>")
                    bufmap({ "i", "s" }, "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

                    -- Custom LSP keymaps
                    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
                    bufmap("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
                    bufmap("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>")
                    bufmap({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
                end,
            })

            -- Auto format buffer on save with attached LSP client. If the LSP supports organizeImports, it will
            -- tidy the imports before formatting the buffer.
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp", { clear = true }),
                callback = function (args)
                    local client_id = args.data.client_id
                    local client = vim.lsp.get_client_by_id(client_id)

                    -- Only set up formatting if the client supports it
                    if client and client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = vim.api.nvim_create_augroup("lsp_format_on_save_" .. args.buf, { clear = true }),
                            buffer = args.buf,
                            callback = function ()
                                -- Organize imports
                                local params = vim.lsp.util.make_range_params(0, "utf-8")
                                params.context = { only = { "source.organizeImports" } }

                                local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
                                for _, res in pairs(result or {}) do
                                    for _, action in pairs(res.result or {}) do
                                        if action.edit or type(action.command) == "table" then
                                            if action.edit then
                                                vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
                                            end
                                            if type(action.command) == "table" then
                                                vim.lsp.buf.execute_command(action.command)
                                            end
                                        end
                                    end
                                end

                                -- Format the buffer
                                vim.lsp.buf.format({ async = false, id = client_id })
                            end,
                        })
                    end
                end
            })
        end
    } }
