local resources = require 'config.lsp.resources'

return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = {
    "rafamadriz/friendly-snippets"
  },
  version = 'v0.*',
  config = function()
    require("blink.cmp").setup {
      appearance = {
        nerd_font_variant = 'normal'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      keymap = {
        ["<CR>"]    = { function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
          'snippet_forward',
          'fallback'
        },
        ['<Up>']    = { 'select_prev', 'fallback' },
        ['<Down>']  = { 'select_next', 'fallback' },
        ['<Tab>']   = { 'select_prev', 'fallback' },
        ['<S-Tab>'] = { 'select_next', 'fallback' },
        ['<C-b>']   = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>']   = { 'scroll_documentation_down', 'fallback' },
      },
      completion = {
        ghost_text = {
          enabled = false
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true
          }
        },
        menu = {
          enabled = true,
          border = 'rounded',
          -- auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          draw = {
            treesitter = {
              'lsp'
            }
          }
        },
      }
    }

    vim.fn.sign_define('DiagnosticSignError', { text = resources.signs['error'], texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = resources.signs['warn'], texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignHint', { text = resources.signs['hint'], texthl = 'DiagnosticSignHint' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = resources.signs['info'], texthl = 'DiagnosticSignInfo' })

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
