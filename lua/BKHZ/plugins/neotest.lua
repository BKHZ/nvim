return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/nvim-nio",
        -- Required adapters
        "nvim-neotest/neotest-go",
    },

    config = function ()
        local neotest = require("neotest")
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        vim.diagnostic.config({
            virtual_text = {
                format = function (diagnostic)
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                end,
            },
        }, neotest_ns)

        ---@diagnostic disable-next-line: missing-fields
        neotest.setup {
            adapters = {
                require("neotest-go")({
                    args = {
                        "-timeout=60s",
                    }
                }),
            },
        }

        -- Run the nearest test
        vim.keymap.set("n", "<leader>tc", function ()
            neotest.run.run()
        end)

        -- Run the tests in current file
        vim.keymap.set("n", "<leader>tf", function ()
            neotest.run.run(vim.fn.expand("%"))
        end)

        -- Show the tests summary window
        vim.keymap.set("n", "<leader>ts", function ()
            neotest.summary.open()
        end)

        -- Show the tests full output window
        vim.keymap.set("n", "<leader>to", function()
            neotest.output.open({ enter = true })
        end)
    end
}
