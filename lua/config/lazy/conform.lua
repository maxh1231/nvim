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
                c = { "clang-format" },
                cpp = { "clang-format" },
                objc = { "astyle" },
                objcpp = { "astyle" },
                cs = { "astyle" },
                python = { "autopep8" },
                go = { "gofmt" }
            },
            format_on_save = {
                lsp_format = "fallback"
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = {
                        "-style={ \
                            IndentWidth: 4, \
                            TabWidth: 4, \
                            AccessModifierOffset: 0, \
                            IndentAccessModifiers: true, \
                        }",
                    }
                }
            }
        })
    end
}
