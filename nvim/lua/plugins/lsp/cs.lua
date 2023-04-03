-- C# LSP integration through omnisharp
local vim = vim
local pid = tostring(vim.fn.getpid())
local lspconfig = require("lspconfig")

lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", pid },
})
