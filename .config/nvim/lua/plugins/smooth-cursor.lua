return {
  'gen740/SmoothCursor.nvim', --> cursor smooth
  opts = {
    cursor = ' '
  },
  config = function ()

    require('smoothcursor').setup({
    cursor = ' '
  })
    vim.cmd.highlight "SmoothCursor guifg=#ff8b39"
  end
}
