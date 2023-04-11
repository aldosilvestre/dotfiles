local config = {
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  code_action_icon = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  definition_preview_icon = "  ",
  rename_prompt_prefix = "➤",
}

for type, icon in pairs {
  Error = config.error_sign,
  Warn = config.warn_sign,
  Hint = config.hint_sign,
  Info = config.infor_sign,
} do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, {
    text = icon,
    texthl = hl,
    numhl = "",
  })
end

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
      -- This option only works in Neovim 0.9
      title = true,
      -- Border type can be single, double, rounded, solid, shadow.
      border = "single",
      winblend = 0,
      expand = "",
      collapse = "",
      code_action = " ",
      code_action_prompt = {
        enable = false
      },
      incoming = " ",
      outgoing = " ",
      hover = ' ',
    },
  }
}
