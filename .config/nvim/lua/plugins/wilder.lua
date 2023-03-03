return {
  'gelguy/wilder.nvim',
  config = function()
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })
    wilder.set_option('renderer', wilder.popupmenu_renderer(
      wilder.popupmenu_palette_theme({
        highlights = {
          border = 'FloatBorder',
        },
        border = 'rounded',
        max_height = '50%', -- max height of the palette
        min_height = 0, -- set to the same as 'max_height' for a fixed height window
        prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
      })
    ))
  end,
}
