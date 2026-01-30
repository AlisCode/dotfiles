-- Typst LSP configuration through tinymist

vim.lsp.config('tinymist', {
    settings = {
        exportPdf = "onType",
        semanticTokens = "disable"
    }
})
vim.lsp.enable('tinymist')

vim.api.nvim_create_user_command("OpenPdf", function()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath:match("%.typ$") then
    os.execute("zathura " .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf")) .. " &")
  end
end, {});

