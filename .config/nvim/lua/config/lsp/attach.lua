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
  keymap('n', 'gi', vim.lsp.buf.implementation, addDescription(bufopts, "Touble LSP implementations"))
  keymap('n', 'gI', '<CMD>Trouble lsp_implementations<CR>', addDescription(bufopts, "Touble LSP implementations"))
  keymap('n', '<leader>f', function()
    local success, plf = pcall(require, 'plf')
    if success then
      plf.format(bufopts)
    else
      vim.lsp.buf.format({ async = true })
    end
  end, addDescription(bufopts, "Format code"))
end
