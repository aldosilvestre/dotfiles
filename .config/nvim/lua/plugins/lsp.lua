local addDescription = require 'config.utils'.addDescription

local source_mapping = {
  luasnip = "Snippet",
  nvim_lsp = "Lsp",
  nvim_lua = "Lua",
  path = "Path",
  buffer = "Buffer",
}

return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    {
      'williamboman/mason.nvim',
      opts = {
        ui = {
          border = "rounded"
        }
      },
      build = function()
        vim.cmd.MasonUpdate()
        -- vim.cmd('MasonUpdate') --> remove spaces from the end of line
      end,
    },
    {
      'L3MON4D3/LuaSnip',
      event = 'VeryLazy',
      dependencies = { 'rafamadriz/friendly-snippets', 'dsznajder/vscode-es7-javascript-react-snippets' }
    },
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/nvim-cmp',     --> Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', --> LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-git',
    -- 'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/nvim-compe',
    { "folke/neodev.nvim", opts = {} },
    -- "lukas-reineke/lsp-format.nvim"
  },
  config = function()
    local lsp = require('lsp-zero').preset({
      manage_nvim_cmp = {
        set_sources = 'recommended'
      }
    })
    local cmp_action = require('lsp-zero').cmp_action()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local luasnip = require('luasnip')

    lsp.setup()
    lsp.set_sign_icons({
      error = " ",
      warn = " ",
      hint = " ",
      info = " "
    })
    lsp.on_attach(function(_, bufnr)
      local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
      }
      local keymap = vim.keymap.set

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      keymap('n', 'gD', vim.lsp.buf.declaration, addDescription(bufopts, "Go to declaration"))
      keymap('n', 'K', '<CMD>Lspsaga hover_doc<CR>', addDescription(bufopts, "Show Hover"))
      keymap('n', '<leader>D', vim.lsp.buf.type_definition, addDescription(bufopts, "Show Type description"))
      keymap('n', '<leader>ca', '<CMD>CodeActionMenu<CR>', addDescription(bufopts, "Show code action menu"))
      keymap('n', '<leader>f', function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
        addDescription(bufopts, "Format code"))
      keymap('n', 'gi', '<CMD>Trouble lsp_implementations<CR>', addDescription(bufopts, "Touble LSP implementations"))

      -- if client.supports_method('textDocument/formatting') then
        -- require('lsp-format').on_attach(client)
      -- end
    end)

    cmp.setup({
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
            vim_item.menu = "(" .. (source_mapping[entry.source.name] or " ") .. ")"
            return vim_item
          end
        })
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab()
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
