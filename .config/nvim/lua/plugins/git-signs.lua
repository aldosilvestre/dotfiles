return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add          = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change       = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete       = { hl = 'GitSignsDelete', text = '-', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
      changedelete = { hl = 'GitSignsChange', text = '~_', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
    current_line_blame_opts = {
      delay = 0
    },
    preview_config = {
      border = 'rounded'
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d %H:%M> - <summary>',
    max_file_length = 10000,
    on_attach = function(bufnr)
      local addDescription = require('config.utils').addDescription
      local gs = require("gitsigns")
      local map = vim.keymap.set
      local opts = { silent = true, noremap = true, buffer = bufnr }

      map('n', 'gb', gs.toggle_current_line_blame, addDescription(opts, "Toggle git blame"))
      map('n', '<leader>gs', gs.stage_buffer, addDescription(opts, "Add to stage"))
      map('n', '<leader>gw', gs.undo_stage_hunk, addDescription(opts, "Undo stage hunk"))
      map('n', '<leader>grb', gs.reset_buffer, addDescription(opts, "Reset buffer"))
      map('n', 'gp', gs.preview_hunk, addDescription(opts, "Preview hunk"))
      map('n', 'ghb', function() gs.blame_line { full = true } end,
        addDescription(opts, "Show git blame line complete"))
      map('n', 'gtd', gs.toggle_deleted, addDescription(opts, "Show delete lines"))

      vim.cmd.highlight 'diffAdded ctermfg=2 guifg=#02f104'
      vim.cmd.highlight "diffChanged ctermfg=3 guifg=#ff8b39"
      vim.cmd.highlight "diffRemoved ctermfg=1 guifg=#fe4450"
      vim.cmd.highlight 'GitSignsCurrentLineBlame gui=italic' --> make blame in italic font
    end
  },
  config = true
}
