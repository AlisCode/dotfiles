local coverage = require("coverage")

function load_cov()
    coverage.load({ place = true })
end

coverage.setup({
    highlights = {
            -- customize highlight groups created by the plugin
            covered = { fg = "#C3E88D" },
            uncovered = { fg = "#F07178" },
    },
    signs = {
            -- use your own highlight groups or text markers
            covered = { hl = "CoverageCovered", text = "▎" },
            uncovered = { hl = "CoverageUncovered", text = "▎" },
    },
})

vim.keymap.set("n", "<Leader>tc", load_cov, { noremap = true, silent = true })
