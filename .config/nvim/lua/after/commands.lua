vim.api.nvim_create_user_command('LazyGit', function() require('snacks').lazygit() end, {})
vim.api.nvim_create_user_command('TodoComments', function() require('snacks').picker.todo_comments() end, {})
