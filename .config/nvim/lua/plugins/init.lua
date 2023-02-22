return {
  'lewis6991/impatient.nvim',
  'kyazdani42/nvim-web-devicons',
  'norcalli/nvim-colorizer.lua',
  'glepnir/galaxyline.nvim',
  'christoomey/vim-tmux-navigator', --> tmux
  { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup() end }, --> autopairs
  'terryma/vim-multiple-cursors', --> multiple cursor
  {
    'phaazon/hop.nvim', --> EasyMotion hop
    branch = 'v2',
    config = function()
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  'norcalli/nvim-colorizer.lua', --> css colors
  'folke/which-key.nvim'
}
