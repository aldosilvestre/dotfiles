local addDescription = require 'config.utils'.addDescription

return function(client, bufnr)
  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  local keymap = vim.keymap.set

  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  keymap('n', 'gD', '<CMD>Lspsaga outgoing_calls<CR>', addDescription(bufopts, "Go to declaration"))

  keymap('n', 'K', '<CMD>Lspsaga hover_doc<CR>', addDescription(bufopts, "Show Hover"))

  keymap('n', '<leader>D', '<CMD>Lspsaga goto_type_definition<CR>', addDescription(bufopts, "Show Type description"))

  keymap('n', '<leader>ca', '<CMD>Lspsaga code_action<CR>', addDescription(bufopts, "Show code action menu"))

  keymap('n', 'gi', '<CMD>Trouble lsp_implementations<CR>', addDescription(bufopts, "Touble LSP implementations"))

  keymap("n", "gr", "<CMD>Trouble lsp_references<CR>", addDescription(bufopts, "Show references"))

  keymap("n", "gd", "<CMD>Lspsaga goto_definition<CR>", addDescription(bufopts, "Show definitions"))

  keymap('n', '<leader>E', '<CMD>lua vim.diagnostic.open_float({border = "rounded"})<CR>', addDescription(bufopts, "Open diagnostic float"))

  keymap('n', '<leader>e', '<CMD>Trouble document_diagnostics<CR>', addDescription(bufopts, "Diagnostics location"))

  keymap('n', '<leader>f', function()
    local success, plf = pcall(require, 'plf')
    if success then
      plf.format(bufopts)
    else
      vim.lsp.buf.format({ async = true })
    end
  end, addDescription(bufopts, "Format code"))
end
