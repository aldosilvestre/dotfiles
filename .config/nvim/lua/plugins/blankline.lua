return {
  'lukas-reineke/indent-blankline.nvim', --> indent guides for neovim
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append("space: ")

    require('indent_blankline').setup {
      char = "▏",
      space_char_blankline = " ",
      show_first_indent_level = false,
      show_current_context = true,
      show_current_context_start = true,
      filetype_exclude = {
        'help',
        'git',
        'markdown',
        'text',
        'terminal',
        'lspinfo',
        'packaer'
      },
      buftype_exclude = {
        'terminal',
        'nofile'
      },
    }
  end
}
