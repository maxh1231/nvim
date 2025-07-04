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

function _G.git_branch()
    local raw = vim.fn.FugitiveStatusline()
    local branch = raw:match("Git%((.+)%)")
    return branch and (" " .. branch) or ""
end

vim.cmd([[
  cabbrev h vert h
  cabbrev help vert help
]])
