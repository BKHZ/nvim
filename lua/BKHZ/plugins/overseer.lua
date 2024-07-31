return {
    "stevearc/overseer.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    config = function ()
        require("overseer").setup {}
    end
}
