return {
  'norcalli/nvim-colorizer.lua', --> css colors
  config = function()
    require 'colorizer'.setup({ '*', '!vim' })
  end
}
