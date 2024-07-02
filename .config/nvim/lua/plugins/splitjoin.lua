-- return {
--   'echasnovski/mini.splitjoin', --> Split join sentences
--   event = "VeryLazy",
--   version = '*',
--   opts = {
--     mappings = {
--       toggle = 'gs',
--       split = '',
--       join = '',
--     }
--   },
--   config = true
-- }
return {
  'Wansmer/treesj',
  keys = { 'gs' },
  config = function()
    require('treesj').setup({
      use_default_keymaps = true,
    })
    vim.keymap.set('n', 'gs', require('treesj').toggle)
  end,
}
