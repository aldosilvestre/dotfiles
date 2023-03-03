return {
  'lewis6991/impatient.nvim',
  'norcalli/nvim-colorizer.lua',
  'nvim-tree/nvim-web-devicons', --> devicons
  'glepnir/galaxyline.nvim',
  'christoomey/vim-tmux-navigator', --> tmux
  'terryma/vim-multiple-cursors', --> multiple cursor
  {
    'phaazon/hop.nvim', --> EasyMotion hop
    branch = 'v2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  'norcalli/nvim-colorizer.lua', --> css colors
  'folke/which-key.nvim', --> key maps
  'windwp/nvim-autopairs', --> autopairs
  'windwp/nvim-ts-autotag'
}
