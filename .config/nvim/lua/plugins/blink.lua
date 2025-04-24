-- local resources = require 'config.lsp.resources'

return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = {
    { "saghen/blink.compat", version = "*", lazy = true, opts = {}, },
    "rafamadriz/friendly-snippets",
    { "echasnovski/mini.icons", opts = {} },
  },
  version = '*',

  opts = {
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
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    require("blink-cmp").setup(opts)

    -- vim.fn.sign_define('DiagnosticSignError', { text = resources.signs['error'], texthl = 'DiagnosticSignError' })
    -- vim.fn.sign_define('DiagnosticSignWarn', { text = resources.signs['warn'], texthl = 'DiagnosticSignWarn' })
    -- vim.fn.sign_define('DiagnosticSignHint', { text = resources.signs['hint'], texthl = 'DiagnosticSignHint' })
    -- vim.fn.sign_define('DiagnosticSignInfo', { text = resources.signs['info'], texthl = 'DiagnosticSignInfo' })

    require("luasnip.loaders.from_vscode").lazy_load()
  end
}

-- return {
--   { "saghen/blink.compat", version = "*", lazy = true, opts = {}, },
--   {
--     "saghen/blink.cmp",
--     -- optional: provides snippets for the snippet source
--     dependencies = {
--       "rafamadriz/friendly-snippets",
--       {
--         "L3MON4D3/LuaSnip",
--         version = "v2.*",
--         name = "luasnip",
--         config = function()
--           require("luasnip.loaders.from_vscode").lazy_load()
--         end,
--       },
--       { "echasnovski/mini.icons", opts = {} },
--     },
--
--     -- use a release tag to download pre-built binaries
--     version = "*",
--     -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
--     -- build = 'cargo build --release',
--     -- If you use nix, you can build from source using latest nightly rust with:
--     -- build = 'nix run .#build-plugin',
--
--     ---@module 'blink.cmp'
--     ---@type blink.cmp.Config
--     opts = {
--       -- 'default' for mappings similar to built-in completion
--       -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
--       -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
--       -- See the full "keymap" documentation for information on defining your own keymap.
--       keymap = {
--         preset = "default",
--         ["<S-Tab>"] = {},
--         ["<Tab>"] = {},
--         ["<C-l>"] = { "snippet_forward", "fallback" },
--         ["<C-j>"] = { "snippet_backward", "fallback" },
--       },
--       signature = {
--         enabled = true,
--         trigger = {
--           enabled = false,
--         },
--       },
--
--       snippets = {
--         preset = "luasnip",
--       },
--       appearance = {
--         -- Sets the fallback highlight groups to nvim-cmp's highlight groups
--         -- Useful for when your theme doesn't support blink.cmp
--         -- Will be removed in a future release
--         use_nvim_cmp_as_default = true,
--         -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--         -- Adjusts spacing to ensure icons are aligned
--         nerd_font_variant = "mono",
--       },
--
--       -- Default list of enabled providers defined so that you can extend it
--       -- elsewhere in your config, without redefining it, due to `opts_extend`
--       sources = {
--         default = function()
--           local sources = { "lsp", "path", "snippets", "buffer" }
--
--           if vim.tbl_contains({ "sql", "mysq", "plsql" }, vim.bo.filetype) then
--             return { "dadbod", "snippets" }
--           end
--
--           if vim.tbl_contains({ "markdown" }, vim.bo.filetype) then
--             return { "buffer", "path", "snippets" }
--           end
--
--           return sources
--         end,
--         providers = {
--           dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
--           copilot = {
--             name = "copilot",
--             module = "blink-cmp-copilot",
--             score_offset = 100,
--             async = true,
--           },
--         },
--       },
--
--       completion = {
--         ghost_text = {
--           enabled = false
--         },
--         list = {
--           selection = {
--             preselect = false,
--             auto_insert = true
--           }
--         },
--         menu = {
--           enabled = true,
--           border = 'rounded',
--           auto_show = function(ctx) return ctx.mode ~= 'cmdline' end,
--           winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
--           draw = {
--             treesitter = {
--               'lsp'
--             }
--           }
--         },
--       }
--     },
--     opts_extend = { "sources.default" },
--     config = function(_, opts)
--       require("blink-cmp").setup(opts)
--     end,
--   },
-- }
