return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/playground",
    "nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag", --> auto tag close
    "RRethy/nvim-treesitter-textsubjects",
    "HiPhish/nvim-ts-rainbow2",
    { "m-demare/hlargs.nvim", config = true },
  },
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
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
    sync_install = true,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true
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
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
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
    }
  }
}
