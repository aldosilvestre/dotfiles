vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- map("gd", require("snacks").picker.lsp_definitions, "[G]oto [D]efinition")
    -- map("gr", require("snacks").picker.lsp_references, "[G]oto [R]eferences")
    -- map("gI", require("snacks").picker.lsp_implementations, "[G]oto [I]mplementation")
    -- map("<leader>D", require("snacks").picker.lsp_type_definitions, "Type [D]efinition")
    -- map("<leader>ds", require("snacks").picker.lsp_symbols, "[D]ocument [S]ymbols")
    -- map("<leader>ws", require("snacks").picker.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
    -- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    -- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    -- map("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover Documentation")
    -- map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")


    map('K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, "Show Hover")
    map('<leader>E', require('snacks').picker.diagnostics, "Open diagnostic float")
    map('<leader>D', require('snacks').picker.lsp_type_definitions, "Show Type description")
    map('gi', require('snacks').picker.lsp_implementations, "Touble LSP implementations")
    map("gd", require('snacks').picker.lsp_definitions, "Show definitions")
    map('<leader>ca', vim.lsp.buf.code_action, "Show code action menu")
    map('gD', '<CMD>Trouble lsp_outgoing_calls<CR>', "Go to declaration")
    map("gr", "<CMD>Trouble lsp_references<CR>", "Show references")
    map('<leader>e', '<CMD>Trouble diagnostics<CR>', "Diagnostics location")
    map('<leader>f', vim.lsp.buf.format, "Format")


    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
        end,
      })
    end

    -- The following autocommand is used to enable inlay hints in your
    -- code, if the language server you are using supports them
    --
    -- This may be unwanted, since they displace some of your code
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map('<leader>h', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
        'Toggle inlay hints')
    end
  end,
})


local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

-- vim.lsp.config("*", {
--   capabilities = require("blink.cmp").get_lsp_capabilities()
-- })
-- require('blink.cmp').get_lsp_capabilities()


vim.lsp.enable({
  'lua_ls',
  'ts_ls',
  'emmet',
  'html',
  'angularls'
})
