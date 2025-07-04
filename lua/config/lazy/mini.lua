return {
    {
        "echasnovski/mini.cursorword",
        version = false,
        config = function()
            require("mini.cursorword").setup()
        end
    },
    {
        "echasnovski/mini.icons",
        version = false,
        config = function()
            require("mini.icons").setup()
        end
    },
    {
        "echasnovski/mini.indentscope",
        version = false,
        config = function()
            local indentscope = require("mini.indentscope")

            indentscope.setup({
                draw = {
                    animation = indentscope.gen_animation.none()
                },
                options = {
                    try_as_border = true,
                    indent_at_cursor = true
                },
            })
        end
    },
    {
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
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        config = function()
            require("mini.statusline").setup({
                content = {
                    active = function()
                        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                        local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                        local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 300 })
                        local location      = MiniStatusline.section_location({ trunc_width = 300 })
                        local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })
                        -- Custom
                        local git_branch    = _G.git_branch()

                        return MiniStatusline.combine_groups({
                            { hl = mode_hl,                 strings = { mode } },
                            { hl = 'MiniStatuslineDevinfo', strings = { git_branch } },
                            '%<', -- Mark general truncate point
                            { hl = 'MiniStatuslineFilename', strings = { filename } },
                            '%=', -- End left alignment
                            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                            { hl = mode_hl,                  strings = { search, location } },
                        })
                    end
                }
            })
        end
    },
    {
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
}
