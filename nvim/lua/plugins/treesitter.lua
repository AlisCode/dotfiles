local treesitter = require("nvim-treesitter")

treesitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

-- Updates Tree-Sitter parsers whenever the plugin is updated
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
        if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

-- Start treesitter automatically if filetype support it
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
      -- vim.treesitter.start throws if the language is not supported.
      -- pcall avoids that
      pcall(vim.treesitter.start, args.buf)
  end,
})
