-- local servers_config = require 'config.lsp.servers'

return {
  { "SmiteshP/nvim-navic" },
  {
    "SmiteshP/nvim-navbuddy",
    -- ft = servers_config.server_avaliable,
    event = "VeryLazy",
    opts = {
      lsp = {
        auto_attach = true, -- If set to true, you don't need to manually use attach function
        preference = nil    -- list of lsp server names in order of preference
      }
    },
    config = true,
  }
}
