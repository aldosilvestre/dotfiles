return {
  "saghen/blink.cmp",
  dependencies = {
    'rafamadriz/friendly-snippets',
  },
  version = '1.*',
  opts = {
    keymap = {
      preset      = 'none',
      ["<CR>"]    = {
        function(cmp)
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
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
      ['<Tab>']   = { 'select_next', 'fallback' },
      ['<C-b>']   = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>']   = { 'scroll_documentation_down', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'normal'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    completion = {
      ghost_text = {
        enabled = false
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false
        }
      },
      menu = {
        enabled = true,
        border = 'rounded',
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,PmenuKind:BlinkCmpKind",
        draw = {
          columns = {
            { "kind_icon", gap = 1 },
            { "label",     "label_description", gap = 1 },
            { "kind",      gap = 1 }
          },
          treesitter = {
            'lsp'
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end
                return icon .. ctx.icon_gap
              end,

              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            }
          },

        }
      },
    }
  },
  opts_extend = { "sources.default" }
}
