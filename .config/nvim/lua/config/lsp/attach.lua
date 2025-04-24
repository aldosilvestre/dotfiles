local addDescription = require 'config.utils'.addDescription

return function(client, bufnr)
  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  local keymap = vim.keymap.set

  keymap('n', 'gD', '<CMD>Lspsaga outgoing_calls<CR>', addDescription(bufopts, "Go to declaration"))

  keymap('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, addDescription(bufopts, "Show Hover"))

  keymap('n', '<leader>D', require('snacks').picker.lsp_type_definitions, addDescription(bufopts, "Show Type description"))

  keymap('n', '<leader>ca', vim.lsp.buf.code_action, addDescription(bufopts, "Show code action menu"))

  keymap('n', 'gi', require('snacks').picker.lsp_implementations, addDescription(bufopts, "Touble LSP implementations"))

  keymap("n", "gr", "<CMD>Trouble lsp_references<CR>", addDescription(bufopts, "Show references"))

  -- keymap("n", "gd", "<CMD>Lspsaga goto_definition<CR>", addDescription(bufopts, "Show definitions"))
  keymap("n", "gd", require('snacks').picker.lsp_definitions, addDescription(bufopts, "Show definitions"))

  keymap('n', '<leader>E', function() vim.diagnostic.open_float({border = "rounded"}) end, addDescription(bufopts, "Open diagnostic float"))

  keymap('n', '<leader>e', '<CMD>Trouble document_diagnostics<CR>', addDescription(bufopts, "Diagnostics location"))

  -- keymap('n', '<leader>f', function()
    -- local success, plf = pcall(require, 'plf')
    -- if success then
    --   plf.format(bufopts)
    -- else
      -- vim.lsp.buf.format({ async = true })
    -- end
  -- end, addDescription(bufopts, "Format code"))
end
