local highlight = require("config.utils").highlight
local colbg = "transparent"

return {
  'maxmx03/fluoromachine.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    -- require 'fluoromachine'.setup {
    --   glow = false,
    --   theme = 'fluoromachine',
    --   transparent = 'full',
    --   overrides = {
    --     ['@comment'] = { italic = true },
    --     ['@conditional'] = { italic = true, bold = true },
    --     ['@constant'] = { bold = true },
    --     ['@function'] = { italic = true, bold = false },
    --     ['@keyword'] = { italic = true, bold = true },
    --     ['@number'] = { italic = false, bold = false },
    --     ['@operator'] = { italic = false, bold = false },
    --     ['@string'] = { italic = false, bold = false },
    --     ['@type'] = { italic = false, bold = false },
    --     ['@variable'] = { italic = false, bold = true },
    --     ['@field'] = { italic = true },
    --     ['@parameter'] = { italic = true },
    --   }
    -- }
    -- vim.cmd.highlight 'Whitespace guibg=transparent'
    -- vim.cmd.colorscheme 'fluoromachine'
    -- vim.cmd.highlight 'CursorLine gui=bold,italic' --> cursorline transparent

    local fm = require 'fluoromachine'
    fm.setup {
      glow = false,
      theme = 'fluoromachine',
      transparent = 'true'
    }
    vim.cmd.colorscheme 'fluoromachine'
    vim.cmd.highlight 'CursorLine gui=bold,italic' --> cursorline transparent

    highlight('DiffAdd',    "#72f1b8",colbg )
    highlight('DiffChange', "#ff8b39",colbg )
    highlight('DiffDelete', "#fe4450",colbg )
    highlight('DiffText',   "#ff8b39",colbg )

  end
}
