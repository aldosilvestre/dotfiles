local highlight = require("config.utils").highlight

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  'https://github.com/romgrk/barbar.nvim'
}, { load = true })

highlight('BufferCurrent',"#FC199A", "transparent" )

require('barbar').setup{
      animation = true,
      auto_hide = false,
      tabpages = true,
      closable = true,
      highlight_visible = true,
      clickable = true,
      icons = {
        button = ' ',
        buffer_index = true,
        -- buffer_number = true,
        filetype = {
          enabled = true
        },
        inactive = {
          button = ' '
        }
      },
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
    }
