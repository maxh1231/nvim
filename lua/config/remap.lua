local autocmd = vim.api.nvim_create_autocmd
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- half page navigation and center screen
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- repeat search in previous direction and center screen
vim.keymap.set("n", "N", "Nzzzv")
-- indent paragraph without moving cursor
vim.keymap.set("n", "=ap", "ma=ap'a")
-- paste in visual mode without overwriting yank buffer
vim.keymap.set("x", "p", [["_dP]])
-- delete without overwriting yank buffer
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

-- Conform format
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ bufnr = 0 })
end)

-- Fugitive :Git
vim.keymap.set("n", "<leader>gs", ":vert Git<CR>")
-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

vim.keymap.set("n", "<leader>nf", ":lua require('neogen').generate()<CR>", {})

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

autocmd("User", {
    pattern = "HarpoonLoaded",
    callback = function()
        local harpoon = require("harpoon")
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>A", function()
            harpoon:list():prepend()
        end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
    end,
})

autocmd("User", {
    pattern = "LuaSnipLoaded",
    callback = function()
        local ls = require("luasnip")
        ls.filetype_extend("javascript", { "jsdoc" })

        vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true })
    end,
})

autocmd("User", {
    pattern = "TelescopeLoaded",
    callback = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
})
