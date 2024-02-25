local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup = function(server)
    require('lspconfig')[server].setup({
        capabilities = lsp_capabilities,
    })
end

require("mason").setup {
    -- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#configuration
    max_concurrent_installers = 4,
    ui = {
        check_outdated_packages_on_open = true
    }
}

require("mason-lspconfig").setup {
	automatic_installation = false,
    -- The language servers that we always want installed automatically.
	ensure_installed = {
		"tsserver",
		"eslint",
		"rust_analyzer",
		"gopls",
		"golangci_lint_ls",
		"kotlin_language_server",
		"yamlls"
	},
    handlers = {
        default_setup,
    }
}

local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = cmp.mapping.preset.insert({
        -- Enter key confirms completion item
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        -- Ctrl + space triggers completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
    })
})
