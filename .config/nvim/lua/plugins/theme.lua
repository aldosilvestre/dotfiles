return {
  'maxmx03/fluoromachine.nvim',
  lazy = false,
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
    vim.cmd.colorscheme 'fluoromachine'
    vim.cmd.highlight 'CursorLine guibg=transparent' --> cursorline transparent
  end
}
