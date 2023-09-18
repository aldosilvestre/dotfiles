return {
  'maxmx03/fluoromachine.nvim',
  priority = 50,
  config = function()
    require('fluoromachine').setup {
      transparent = true,
      glow = true,
      theme = 'fluoromachine',
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
  end
}
