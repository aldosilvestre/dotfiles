return {
  'Wansmer/treesj',
  keys = { 'gs' },
  config = function()
    require('treesj').setup({
      use_default_keymaps = true,
    })
    vim.keymap.set('n', 'gs', require('treesj').toggle)
  end
}
