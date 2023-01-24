return {
  'declancm/cinnamon.nvim', --> smoth scroll
  config = function()
    require("cinnamon").setup({ {
      extra_keymaps = true,
      override_keymaps = true,
      max_length = 400,
      scroll_limit = -1,
    } })
  end
}
