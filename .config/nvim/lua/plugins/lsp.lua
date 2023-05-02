local function addDescription(table, desc)
  table['desc'] = desc
  return table
end

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
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {
      'L3MON4D3/LuaSnip',
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
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/nvim-compe',
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
      error = " ",
      warn = " ",
      hint = " ",
      info = " "
    })
    lsp.on_attach(function(_, bufnr)
      local bufopts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
      }
      local keymap = vim.keymap.set

      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
      keymap('n', 'K', '<CMD>Lspsaga hover_doc<CR>', addDescription(bufopts, "show Hover"))
      keymap('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
      keymap('n', '<leader>ca', '<CMD>CodeActionMenu<CR>', bufopts)
      keymap('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, addDescription(bufopts, "formatting"))

      keymap('n', 'gi', '<CMD>Trouble lsp_implementations<CR>', bufopts)
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
            vim_item.kind = " " .. (lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or "") .. " "
            vim_item.menu = "(" .. (source_mapping[entry.source.name] or " ") .. ")"
            return vim_item
          end
        })
      },
      mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    })
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
