return {
  "folke/which-key.nvim",
  -- event = "VeryLazy",
  cmd = "WhichKey",
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      icons = {
        rules = false,
      },
    })
  end,
}
