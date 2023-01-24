return {
  'lewis6991/impatient.nvim',
  'kyazdani42/nvim-web-devicons',
  'norcalli/nvim-colorizer.lua',
  'glepnir/galaxyline.nvim',
  'AndrewRadev/splitjoin.vim', --> switching between a single-line statement and a multi-line one
  {
    'declancm/cinnamon.nvim',
    config = function()
      require("cinnamon").setup({ {
        extra_keymaps = true,
        override_keymaps = true,
        max_length = 500,
        scroll_limit = -1,
      } })
    end
  }, --> smoth scroll
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

  'norcalli/nvim-colorizer.lua' --> css colors
}
