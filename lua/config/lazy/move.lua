return {
    "echasnovski/mini.move",
    version = false,
    config = function()
        require("mini.move").setup({
            mappings = {
                left = "<S-h>",
                right = "<S-l>",
                down = "<S-j>",
                up = "<S-k>",
            }
        })
    end
}
