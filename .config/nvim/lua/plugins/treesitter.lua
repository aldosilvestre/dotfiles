return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-ts-context-commentstring",
    "nvim-treesitter/playground",
    "RRethy/nvim-treesitter-textsubjects",
    "HiPhish/nvim-ts-rainbow2",
    { "m-demare/hlargs.nvim", config = true },
  },
  build = ":TSInstallFromGrammar",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "javascript", "lua", "css", "html", "dockerfile", "json", "typescript", "markdown", "go",
        "gomod", "markdown_inline", "http", "sql", "yaml", "vue", "tsx", "regex" },
      sync_install = true,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
          "#cc241d",
          "#a89984",
          "#b16286",
          "#d79921",
          "#689d6a",
          "#d65d0e",
          "#458588",
        },
        termcolors = {
          "Red",
          "Green",
          "Yellow",
          "Blue",
          "Magenta",
          "Cyan",
          "White",
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
          ['i;'] = 'textsubjects-container-inner',
        },
      }
    }
  end
}
