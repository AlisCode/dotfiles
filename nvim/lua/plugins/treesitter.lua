local treesitter = require("nvim-treesitter")

treesitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
