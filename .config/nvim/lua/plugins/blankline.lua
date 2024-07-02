return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPre',
  main = "ibl",
  config = function()
    require('ibl').setup({
      indent = {
        char = ""
      },
      whitespace = {
        remove_blankline_trail = false,
      },
      scope = {
        enabled = true,
        char = "▎"
      }
    })
  end
}
