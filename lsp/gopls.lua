return {
    on_attach = function ()
        print("gopls LSP attached")
    end,
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
