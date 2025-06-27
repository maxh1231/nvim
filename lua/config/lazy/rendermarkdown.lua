return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
        require("render-markdown").setup({
            completions = { lsp = { enabled = true } },
            render_modes = { "n" }
        })
    end,
}
