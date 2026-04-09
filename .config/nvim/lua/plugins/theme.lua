local highlight = require("config.utils").highlight
local colbg = "transparent"

return {
  'maxmx03/fluoromachine.nvim',
  lazy = false,
  priority = 1000,
  config = function()
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
