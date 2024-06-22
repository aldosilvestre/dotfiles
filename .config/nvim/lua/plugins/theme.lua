local highlight = require("config.utils").highlight

return {
  'maxmx03/fluoromachine.nvim',
  priority = 1000,
  config = function()
    require 'fluoromachine'.setup {
      glow = true,
      theme = 'fluoromachine',
      transparent = 'full',
      overrides = {
        ['@comment'] = { italic = true },
        ['@conditional'] = { italic = true, bold = true },
        ['@constant'] = { bold = true },
        ['@function'] = { italic = true, bold = false },
        ['@keyword'] = { italic = true, bold = true },
        ['@number'] = { italic = false, bold = false },
        ['@operator'] = { italic = false, bold = false },
        ['@string'] = { italic = false, bold = false },
        ['@type'] = { italic = false, bold = false },
        ['@variable'] = { italic = false, bold = true },
        ['@field'] = { italic = true },
        ['@parameter'] = { italic = true },
      }
    }

    highlight('IndentBlanklineChar', "#805495", "transparent")
    highlight('IndentBlanklineContextChar', "#FC199A", "transparent")
    vim.cmd.colorscheme 'fluoromachine'
  end
}
