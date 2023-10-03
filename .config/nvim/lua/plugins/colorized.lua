return {
  'norcalli/nvim-colorizer.lua', --> css colors
  event = "VeryLazy",
  config = function()
    require 'colorizer'.setup({ '*', '!vim' })
  end
}
