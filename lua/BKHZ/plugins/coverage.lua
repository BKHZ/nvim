return {
    "andythigpen/nvim-coverage",
    enabled = true,
    ft = { "go" },
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ts", "<cmd>Coverage<cr><cmd>CoverageSummary<cr>", desc = "Show coverage summary" },
        { "<leader>tS", "<cmd>Coverage<cr>", desc = "Show coverage gutter signs" },
        { "<leader>tH", "<cmd>CoverageHide<cr>", desc = "Hide coverage gutter signs" }
    },
    config = function ()
        require("coverage").setup {
            commands = true,
            auto_reload = true,
            highlights = {
                covered = { fg = "#C3E88D" },
                uncovered = { fg = "#F07178" }
            },
            summary = {
                -- Minimum test coverage percentage
                min_coverage = 80.0
            },
            lang = {
                go = {
                    coverage_file = vim.fn.getcwd() .. "/coverage.out"
                }
            },
            load_coverage_cb = function (ftype)
                vim.notify("Loaded " .. ftype .. " coverage")
            end,
        }
    end
}
