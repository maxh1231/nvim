return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = {
                            'vim',
                            'require',
                        },
                    },
                },
            },
        })

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "marksman",
                "bashls",
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "emmet_language_server",
                "gh_actions_ls",
                "html",
                "tailwindcss",
                "graphql",
                "java_language_server",
                "ts_ls",
                "eslint",
                "clangd"
                -- TODO: "sqls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
            }
        })
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                if client.name ~= "eslint" then
                    return
                end

                local orig_publish = vim.lsp.handlers["textDocument/publishDiagnostics"]
                vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
                    if ctx.client_id == client.id and result and result.diagnostics then
                        result.diagnostics = vim.tbl_filter(function(diagnostic)
                            return diagnostic.code ~= "prettier/prettier"
                        end, result.diagnostics)
                    end
                    return orig_publish(err, result, ctx, config)
                end
            end,
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "render-markdown" }
            }),
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        vim.diagnostic.config({
            severity_sort = true,
            virtual_text = {
                format = function(diagnostic)
                    if diagnostic.code == "prettier/prettier" then
                        return nil
                    end
                    return diagnostic.message
                end,
            },
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
