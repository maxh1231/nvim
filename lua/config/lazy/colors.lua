function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
            require("rose-pine").setup({
                variant = "moon",
                styles = {
                    italic = false,
                    transparency = true
                },
                dim_inactive_windows = false,
                extend_background_behind_borders = true,
            })
            ColorMyPencils()
        end
    },
}
