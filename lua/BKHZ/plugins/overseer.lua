return {
    "stevearc/overseer.nvim",
    enabled = true,
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    config = function ()
        require("overseer").setup {}
    end
}
