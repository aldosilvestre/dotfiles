return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPre",
  config = function()
    require("plugins.treesitter")

    vim.cmd.highlight 'RainbowDelimiterPink guifg=Pink'
    vim.cmd.highlight 'RainbowDelimiterYellow guifg=Yellow'
    vim.cmd.highlight 'RainbowDelimiterOrange guifg=Orange'
    vim.cmd.highlight 'RainbowDelimiterGreen guifg=Green'
    vim.cmd.highlight 'RainbowDelimiterViolet guifg=Violet'
    vim.cmd.highlight 'RainbowDelimiterCyan guifg=Cyan'

    require 'nvim-treesitter.configs'.setup(
      {
        ensure_installed = {
          "bash",
          "lua",
          "luadoc",
          "jsdoc",
          "javascript",
          "css",
          "scss",
          "html",
          "json",
          "typescript",
          "tsx",
          "svelte",
          "vue",
          "astro",
          "go",
          "gomod",
          "dot",
          "markdown_inline",
          "http",
          "sql",
          "yaml",
          "regex",
          "dockerfile",
          "tsv"
        },
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
          termcolors = { "Red", "Green", "Yellow", "Blue", "Magenta", "Cyan", "White" }
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["of"] = "@function.outer",
              ["if"] = "@function.inner",
              ["oc"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",
              ["ol"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          }
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            scope_incremental = "is",
            init_selection = "gnn",
            node_incremental = "in",
            node_decremental = "im",
          }
        },
        autotag = {
          enable = true
        },
        matchup = {
          enable = true
        }
      }
    )
  end,
  dependencies = {
    {
      "hiphish/rainbow-delimiters.nvim",
      config = function()
        require('rainbow-delimiters.setup').setup {
          highlight = {
            'RainbowDelimiterPink',
            'RainbowDelimiterOrange',
            'RainbowDelimiterGreen',
            'RainbowDelimiterViolet',
            'RainbowDelimiterYellow',
            'RainbowDelimiterCyan',
          }
        }
      end
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    "nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag", --> auto tag close
    "RRethy/nvim-treesitter-textsubjects",
    { "m-demare/hlargs.nvim", config = true },
  }
}
