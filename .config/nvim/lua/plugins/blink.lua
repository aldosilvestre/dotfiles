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
      sources = {
        completion = {
          enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        -- providers = {
        --   lsp = {
        --     name = "LSP",
        --     module = "blink.cmp.sources.lsp"
        --   },
        --   path = {
        --     name = "Path",
        --     module = "blink.cmp.sources.path",
        --     score_offset = 3
        --   },
        --   snippets = {
        --     name = "Snippets",
        --     module = "blink.cmp.sources.snippets",
        --     score_offset = -1
        --   },
        --   buffer = {
        --     name = "Buffer",
        --     module = "blink.cmp.sources.buffer",
        --     keyword_length = 3,
        --     fallback_for = { "lsp" }
        --   }
        -- }
      },
      highlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = "normal",
      keymap = {
        accept = "<CR>",
        scroll_documentation_up = "<C-b>",
        scroll_documentation_down = "<C-f>",
        select_next = { "<Tab>", "<Down>" },
        select_prev = { "<S-Tab>", "<Up>" },
      },
      windows = {
        autocomplete = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          selection = 'auto_insert',
          cycle = { from_top = false },
          draw = 'reversed',
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          auto_show = true,
          min_width = 15,
          max_width = 50,
          max_height = 15,
          auto_show_delay_ms = 100,
        },
        signature_help = {
          border = "rounded",
        }
      },
    }

    vim.fn.sign_define('DiagnosticSignError', { text = resources.signs['error'], texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = resources.signs['warn'], texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignHint', { text = resources.signs['hint'], texthl = 'DiagnosticSignHint' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = resources.signs['info'], texthl = 'DiagnosticSignInfo' })

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
