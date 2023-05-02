return {
  'romgrk/barbar.nvim',
  event = 'BufEnter',
  config = function()
    require('bufferline').setup({
      animation = true,
      auto_hide = false,
      tabpages = true,
      closable = true,
      clickable = true,
      -- exclude_ft = { 'javascript' },
      -- exclude_name = { 'package.json' },
      icons = { filetype = { enabled = true } },
      icon_custom_colors = false,
      icon_pinned_button = '車',
      insert_at_end = false,
      insert_at_start = false,
      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 30,
      semantic_letters = true,
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
      no_name_title = nil,
    })
  end
}
