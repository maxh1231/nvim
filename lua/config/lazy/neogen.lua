return {
    "danymat/neogen",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },
    vim.api.nvim_exec_autocmds("User", { pattern = "NeogenLoaded" })
}
