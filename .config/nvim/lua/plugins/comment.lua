return {
  'numToStr/Comment.nvim', --> comment
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring'
  },
  keys = { { "<leader>cc" }, { "<leader>bc" }, { "cc", mode = "v" }, { "bc", mode = "v" } },
  config = function()
    require('Comment').setup {
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = '<leader>cc',
        block = '<leader>bc',
      },
      opleader = {
        line = 'cc',
        block = 'bc',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = false,
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      post_hook = nil,
    }
  end
}
