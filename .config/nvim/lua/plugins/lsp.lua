local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)

  vim.api.nvim_set_keymap('n', 'gi', '<CMD>Trouble lsp_implementations<CR>', { silent = true })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "onsails/lspkind-nvim",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/nvim-cmp", --> Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp", --> LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    "hrsh7th/nvim-compe",
    "folke/lsp-trouble.nvim",
    { 'L3MON4D3/LuaSnip', dependencies = { 'rafamadriz/friendly-snippets' } }
  },
  event = "VeryLazy",
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp = require("cmp")
    local luasnip = require('luasnip')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    mason.setup()
    mason_lspconfig.setup()
    mason_lspconfig.setup_handlers({
      function(server)
        require("lspconfig")[server].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          init_options = { documentFormatting = true, codeAction = true }
        }
      end
    })

    local source_mapping = {
      buffer = "Buffer",
      nvim_lsp = "Lsp",
      nvim_lua = "Lua",
      cmp_tabnine = "TN",
      path = "Path",
    }
    cmp.setup {
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = require("lspkind").symbolic(vim_item.kind, { mode = "symbol" })
          vim_item.menu = source_mapping[entry.source.name]
          local maxwidth = 80
          vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      sources = {
        { name = "buffer" },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = "path" },
      },
      mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        })
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      experimental = {
        ghost_text = true,
      },
    }
    require("luasnip/loaders/from_vscode").lazy_load()
  end
}
