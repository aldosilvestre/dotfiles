local on_attach = require 'config.lsp.attach'
local servers_config = require 'config.lsp.servers'

return {
  'neovim/nvim-lspconfig',
  -- ft = servers_config.server_avaliable,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
        },
      },
    },
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"

    mason_lspconfig.setup()
    mason_lspconfig.setup_handlers({
      function(server)
        lspconfig[server].setup {
          on_attach = on_attach,
          settings = servers_config.settings[server],
          commands = servers_config.commands[server],
          init_options = {
            documentFormatting = true,
            codeAction = true,
            codelens = true
          }
        }
      end
    })
    vim.cmd.highlight "LspInlayHint cterm=bold gui=bold,italic guifg=#495495"
  end
}
