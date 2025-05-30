return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                json = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                graphql = { "prettier" },
                markdown = { "prettier" },
                c = { "astyle" },
                cpp = { "astyle" },
                objc = { "astyle" },
                objcpp = { "astyle" },
                cs = { "astyle" },
            },
            format_on_save = {
                lsp_format = "fallback"
            }
        })
    end
}
