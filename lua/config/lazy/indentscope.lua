return {
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
}
