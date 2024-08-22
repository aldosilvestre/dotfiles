return {
  { "SmiteshP/nvim-navic" },
  {
    "SmiteshP/nvim-navbuddy",
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
