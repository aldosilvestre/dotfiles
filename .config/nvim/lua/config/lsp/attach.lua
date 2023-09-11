local addDescription = require 'config.utils'.addDescription

return function(client, bufnr)
  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  local keymap = vim.keymap.set

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  keymap('n', 'gD', vim.lsp.buf.declaration, addDescription(bufopts, "Go to declaration"))
  keymap('n', 'K', vim.lsp.buf.hover, addDescription(bufopts, "Show Hover"))
  keymap('n', '<leader>D', vim.lsp.buf.type_definition, addDescription(bufopts, "Show Type description"))
  keymap('n', '<leader>ca', '<CMD>CodeActionMenu<CR>', addDescription(bufopts, "Show code action menu"))
  keymap('n', '<leader>f', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
    addDescription(bufopts, "Format code"))
  keymap('n', 'gi', vim.lsp.buf.implementation, addDescription(bufopts, "Touble LSP implementations"))
  keymap('n', 'gI', '<CMD>Trouble lsp_implementations<CR>', addDescription(bufopts, "Touble LSP implementations"))

  if client.server_capabilities.inlayHintProvider then
    local success, inlay_hint = pcall(require, "vim.lsp.inlay_hint")
    if success then inlay_hint(bufnr, true) end
  end
end
