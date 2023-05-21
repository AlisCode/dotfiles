-- C# LSP integration through omnisharp
local pid = tostring(vim.fn.getpid())
local lspconfig = require("lspconfig")

vim.g.OmniSharp_server_path = '/usr/bin/omnisharp'

local on_attach_omnisharp = function(client)
    -- https://github.com/williamboman/mason-lspconfig.nvim/issues/211
    client.server_capabilities.semanticTokensProvider = nil
end

lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", pid },
    on_attach = on_attach_omnisharp,
})
