local resources = require 'config.lsp.resources'

return {
  'hrsh7th/nvim-cmp', --> Autocompletion plugin
  event = "VeryLazy",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', --> LSP source for nvim-cmp
    'hrsh7th/nvim-compe',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-compe',
    'hrsh7th/cmp-git',
    { "folke/neodev.nvim", opts = {} },
    'saadparwaiz1/cmp_luasnip',
    {
      'L3MON4D3/LuaSnip',
      event = 'VeryLazy',
      dependencies = { 'rafamadriz/friendly-snippets', 'dsznajder/vscode-es7-javascript-react-snippets' }
    },
  },
  config = function()
    local cmp = require "cmp"
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    vim.fn.sign_define('DiagnosticSignError', { text = resources.signs['error'], texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = resources.signs['warn'], texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignHint', { text = resources.signs['hint'], texthl = 'DiagnosticSignHint' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = resources.signs['info'], texthl = 'DiagnosticSignInfo' })

    cmp.setup({
      sources = resources.cmp_sources,
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            vim_item.kind = (lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or "")
            vim_item.abbr = " " .. vim_item.abbr .. " "
            vim_item.menu = "(" .. (resources.source_mapping[entry.source.name] or " ") .. ")"
            return vim_item
          end
        })
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
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
        end, { 'i', 's' })
      })
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
