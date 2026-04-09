local commentNvim = {
  'numToStr/Comment.nvim', --> comment
  lazy = false,
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  -- keys = { { "<leader>/", desc = "Toggle line comment" }, { "<leader>?", desc = "Toggle block comment" },
  -- { "<leader>/", mode = "v" }, { "<leader>?", mode = "v" } },
  config = function()
    require('Comment').setup {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      -- ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = '<leader>/',
        ---Block-comment toggle keymap
        block = '<leader>?',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = '<leader>/',
        ---Block-comment keymap
        block = '<leader>?',
      },
      ---Enable keybindings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `co`, `cO`, `cA`
        extra = false,
      },
      ---Function to call before (un)comment
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      ---Function to call after (un)comment
      -- post_hook = nil,
    }
  end
}

return {
  'nvim-mini/mini.comment',
  version = '*',
  opts = {
      -- Options which control module behavior
      options = {
        -- Function to compute custom 'commentstring' (optional)
        custom_commentstring = nil,

        -- Whether to ignore blank lines when commenting
        ignore_blank_line = false,

        -- Whether to ignore blank lines in actions and textobject
        start_of_line = true,

        -- Whether to force single space inner padding for comment parts
        pad_comment_parts = true,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = '',

        -- Toggle comment on current line
        comment_line = '<C-/>',

        -- Toggle comment on visual selection
        comment_visual = '<C-/>',

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        -- Works also in Visual mode if mapping differs from `comment_visual`
        textobject = '<leader>?',
      },

      -- Hook functions to be executed at certain stage of commenting
      hooks = {
        -- Before successful commenting. Does nothing by default.
        pre = function() end,
        -- After successful commenting. Does nothing by default.
        post = function() end,
      },
    }
}
