return {
    'echasnovski/mini.surround',
    version = false,
    config = function()
        require("mini.surround").setup({
            mappings = {
                find = "",
                find_left = "",
                highlight = ""
            }
        })
    end
}
