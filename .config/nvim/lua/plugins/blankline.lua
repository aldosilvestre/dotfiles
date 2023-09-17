return {
  'lukas-reineke/indent-blankline.nvim',
  branch = 'v3',
  event = 'BufReadPre',
  config = function()
    require "ibl".setup({
      indent = {
        char = "▏",
        tab_char = nil,
        highlight = "IndentBlanklineChar",
        smart_indent_cap = true,
        priority = 1024,
      },
      whitespace = {
        highlight = "Whitespace",
        remove_blankline_trail = false,
      },
      scope = {
        enabled = true,
        highlight = "IndentBlanklineContextChar",
        char = "▎"
      }
    })
  end
}
