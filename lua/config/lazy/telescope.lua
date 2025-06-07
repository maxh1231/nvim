return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    vim.api.nvim_exec_autocmds("User", { pattern = "TelescopeLoaded" })
}
