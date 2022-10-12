local success, comment = pcall(require, 'Comment')

if not success then
  vim.notify("Couldn't load Comment" .. comment, "error")
  return
end

comment.setup {
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>cc',
    ---Block-comment toggle keymap
    block = '<leader>bc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = 'cc',
    ---Block-comment keymap
    block = 'bc',
  },
  ---LHS of extra mappings
  extra = {
    ---Add comment on the line above
    above = 'gcO',
    ---Add comment on the line below
    below = 'gco',
    ---Add comment at the end of line
    eol = 'gcA',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Operator-pending mapping; `cc` `bc` `cc[count]{motion}` `b[count]{motion}`
    basic = true,
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false,
  },
  ---Function to call before (un)comment
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  ---Function to call after (un)comment
  post_hook = nil,
}
