return {
  'glepnir/lspsaga.nvim',
  lazy = false,
  -- event = "LspAttach",
  opts = {
    lightbulb = {
      enable = false,
      enable_in_insert = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    ui = {
      -- This option only works in Neovim 0.9
      title = true,
      -- Border type can be single, double, rounded, solid, shadow.
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
      enable = true,
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
