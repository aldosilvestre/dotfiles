return {
  'glepnir/lspsaga.nvim',
  event = "LspAttach",
  opts = {
    lightbulb = {
      enable = false,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    ui = {
      title = true,
      border = "rounded",
      winblend = 0,
      expand = "",
      collapse = "",
      code_action = " ",
      code_action_prompt = {
        enable = true
      },
      incoming = " ",
      outgoing = " ",
      hover = ' ',
    },
    symbol_in_winbar = {
      enable = false,
      separator = " ",
      ignore_patterns = {},
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
      respect_root = false,
      color_mode = true,
    },
  }
}
