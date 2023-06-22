return {
  'romgrk/barbar.nvim',
  init = function() vim.g.barbar_auto_setup = false end,
  event = 'BufEnter',
  config = function()
    require('barbar').setup({
      animation = true,
      auto_hide = false,
      tabpages = true,
      closable = true,
      clickable = true,
      icons = { button = ' ', filetype = { enabled = true }, inactive = { button = ' ' } },
      icon_custom_colors = false,
      icon_pinned_button = ' ',
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
