---@diagnostic disable: undefined-global
return require 'packer'.startup(function()
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/galaxyline.nvim'

  use 'nvim-neo-tree/neo-tree.nvim'
  use 'MunifTanjim/nui.nvim' --> Dependency from neo tree
  use 's1n7ax/nvim-window-picker' --> Window picker

  use("nvim-lua/plenary.nvim")

  use("lukas-reineke/indent-blankline.nvim") --> indent guides for neovim

  use("nvim-telescope/telescope.nvim") --> Find, Filter, Preview, Pick. All lua, all the time.

  use 'christoomey/vim-tmux-navigator' --> tmux

  --> bufferline
  use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  --> notify
  use("rcarriga/nvim-notify")

  --> themes
  use("EdenEast/nightfox.nvim") --> nightfox colorsceme for neovim
  use("sainnhe/gruvbox-material")
  use("maxmx03/FluoroMachine.nvim")
  use { 'folke/tokyonight.nvim' }

  use("windwp/nvim-autopairs")

  --> treesitter & treesitter modules/plugins
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  --> EasyMotion hop
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  --> Kitty term
  use "fladson/vim-kitty"

  --> comment
  use('numToStr/Comment.nvim')

  --> lsp
  use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
  use {
    "williamboman/mason.nvim", --> LSP installers
    "williamboman/mason-lspconfig.nvim", --> attach LSP servers
    "neovim/nvim-lspconfig" --> Collection of configurations for built-in LSP client
  }
  use("WhoIsSethDaniel/mason-tool-installer.nvim")

  --> Completitions
  use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
  use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
  use("hrsh7th/nvim-cmp") --> Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use("hrsh7th/nvim-compe")
  use("folke/lsp-trouble.nvim") --> show diagnostics code and quickfix
  use("saadparwaiz1/cmp_luasnip")
  use { 'L3MON4D3/LuaSnip', requires = { 'rafamadriz/friendly-snippets' }, after = 'cmp_luasnip' } --> Snippets plugin

  --> Git
  use('lewis6991/gitsigns.nvim')
  use('rhysd/git-messenger.vim')
  use('whiteinge/diffconflicts')
  use('f-person/git-blame.nvim')

  --> tabnine
  --use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

  --> Multiple cursors
  use('terryma/vim-multiple-cursors')

  --> Color picker css
  use({ "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  })

  --> Testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }

  --> Cinnamon
  use('declancm/cinnamon.nvim')

  --> utilities
  use('AndrewRadev/splitjoin.vim') --> switching between a single-line statement and a multi-line one
  use { 'folke/which-key.nvim', event = "BufWinEnter" } --> displays a popup with possible key bindings of the command
  use{'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} --> Fold look
end)
