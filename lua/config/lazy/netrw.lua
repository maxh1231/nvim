return {
    { 'echasnovski/mini.icons', version = false },
    {
        "prichrd/netrw.nvim",
        opts = {},
        config = function()
            require("netrw").setup({
                icons = {
                    directory = "󰉋"
                },
                use_devicons = true
            })
        end
    }
}
