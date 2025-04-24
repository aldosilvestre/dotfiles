-- local on_attach = require 'config.lsp.attach'
-- local servers_config = require 'config.lsp.servers'

-- return {
--   'neovim/nvim-lspconfig',
--   -- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
--   lazy = false,
--   dependencies = {
--     {
--       "williamboman/mason.nvim",
--       opts = {
--         ui = {
--           border = "rounded",
--           height = 0.6,
--           width = 0.5,
--         },
--       },
--     },
--     "williamboman/mason-lspconfig.nvim",
--     {
--       "saghen/blink.compat",
--       -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
--       version = "*",
--       -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
--       lazy = true,
--       -- make sure to set opts so that lazy.nvim calls blink.compat's setup
--       opts = {},
--     },
--     'saghen/blink.cmp'
--   },
--   config = function()
--     local lspconfig = require "lspconfig"
--     local mason_lspconfig = require "mason-lspconfig"
--
--     mason_lspconfig.setup()
--     mason_lspconfig.setup_handlers({
--       function(server)
--         lspconfig[server].setup {
--           on_attach = on_attach,
--           settings = servers_config.settings[server],
--           commands = servers_config.commands[server],
--           capabilities = require('blink.cmp').get_lsp_capabilities(),
--           init_options = {
--             documentFormatting = true,
--             codeAction = true,
--             codelens = true
--           }
--         }
--       end
--     })
--     -- vim.cmd.highlight "LspInlayHint cterm=bold gui=bold,italic guifg=#495495"
--   end
-- }
--
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  opts = {
    ui = {
      border = "rounded",
      height = 0.6,
      width = 0.5,
    },
  },
  config = true
}
