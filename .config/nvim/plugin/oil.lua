vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

vim.api.nvim_create_user_command('Oil', function() require('oil') end, {})

require('oil').setup {
  default_file_explorer = false
}
