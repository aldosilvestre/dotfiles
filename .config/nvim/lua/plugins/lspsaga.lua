return {
  "glepnir/lspsaga.nvim",
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
