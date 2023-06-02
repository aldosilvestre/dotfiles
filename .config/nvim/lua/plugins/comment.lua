return {
  'numToStr/Comment.nvim', --> comment
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  keys = { { "<leader>/" }, { "<leader>?" }, { "<leader>/", mode = "v" }, { "<leader>?", mode = "v" } },
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
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = 'cO',
        ---Add comment on the line below
        below = 'co',
        ---Add comment at the end of line
        eol = 'cA',
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
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
