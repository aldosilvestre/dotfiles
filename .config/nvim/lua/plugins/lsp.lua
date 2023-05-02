function addDescription(table, desc)
  table['desc'] = desc
  return table
end

local on_attach = function(_, bufnr)
  local bufopts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, addDescription(bufopts, "show Hover"))
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>ca', '<CMD>CodeActionMenu<CR>', bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, bufopts)

  vim.api.nvim_set_keymap('n', 'gi', '<CMD>Trouble lsp_implementations<CR>', bufopts)
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "jose-elias-alvarez/null-ls.nvim",
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded"
        }
      }
    },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
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
    {
      'L3MON4D3/LuaSnip',
      dependencies = {
        'rafamadriz/friendly-snippets',
        'dsznajder/vscode-es7-javascript-react-snippets'
      }
    },

  },
  event = "VeryLazy",
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    mason.setup {}
    mason_lspconfig.setup()
    mason_lspconfig.setup_handlers({
      function(server)
        lspconfig[server].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          init_options = { documentFormatting = true, codeAction = true }
        }
      end
    })

    local source_mapping = {
      luasnip = "Snippet",
      nvim_lsp = "Lsp",
      nvim_lua = "Lua",
      path = "Path",
      buffer = "Buffer",
    }

    cmp.setup {
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = 'symbol_text',  -- show only symbol annotations
          maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          before = function(entry, vim_item)
            vim_item.kind = " " .. (lspkind.symbolic(vim_item.kind, { mode = "symbol" }) or "") .. " "
            vim_item.menu = "(" .. (source_mapping[entry.source.name] or " ") .. ")"
            return vim_item
          end
        })
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
        ghost_text = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    }
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
