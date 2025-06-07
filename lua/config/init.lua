require("config.remap")
require("config.set")
require("config.lazy_init")

local autocmd = vim.api.nvim_create_autocmd

-- rename compose files to support lsp
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "docker-compose*.yml", "docker-compose*.yaml" },
    callback = function()
        vim.bo.filetype = "yaml.docker-compose"
    end,
})

autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local buf = vim.fn.expand("%")
        if buf:sub(1, 1) == "/" then
            vim.cmd("file " .. vim.fn.expand("%:~:."))
        end
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
