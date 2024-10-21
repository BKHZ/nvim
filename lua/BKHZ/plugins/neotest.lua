return {
    "nvim-neotest/neotest",
    enabled = true,
    ft = { "go" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/nvim-nio",
        -- Required adapters
        -- "nvim-neotest/neotest-go",
        "fredrikaverpil/neotest-golang",
    },

    config = function ()
        local neotest = require("neotest")
        local neotest_ns = vim.api.nvim_create_namespace("neotest")
        local neotest_golang = require("neotest-golang")

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
            running = {
                concurrent = true
            },
            ---@diagnostic disable-next-line: missing-fields
            summary = {
                animated = false,
            },
            adapters = {
                neotest_golang {
                    warn_test_not_executed = true,
                    warn_test_name_dupes = true,
                    dev_notifications = true,
                    -- runner = "gotestsum",
                    -- gotestsum_args = { "--format=standard-verbose" },
                    go_test_args = {
                        "-v",
                        "-cover",
                        "-race",
                        "-count=1",
                        "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
                        "-parallel=1",
                        "./..."
                    }
                },
            },
        }

        -- Run the nearest test
        vim.keymap.set("n", "<leader>tc", function ()
            neotest.run.run({ suite = false})
        end)

        -- Run the tests in current file
        vim.keymap.set("n", "<leader>tf", function ()
            neotest.run.run(vim.fn.expand("%"))
        end)

        -- Show the tests full output window
        vim.keymap.set("n", "<leader>to", function()
            neotest.output.open({ enter = true })
        end)
    end
}
