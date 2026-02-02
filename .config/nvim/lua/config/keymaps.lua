local addDescription = require('config.utils').addDescription

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fast actions
map('n', '<leader>q', '<CMD>q<CR>', addDescription(opts, 'Fast quit'))  --> Quit
map('n', '<leader>w', '<CMD>w<CR>', addDescription(opts, 'Fast write')) --> Save

-- Search
map('n', 'ff', function() require('snacks').picker.files({ hidden = true }) end, addDescription(opts, 'Find Files'))
map('n', 'fg', function() require('snacks').picker.grep({ hidden = true }) end, addDescription(opts, 'Find with grep'))
map('n', 'fh', function() require('snacks').picker.help() end, addDescription(opts, 'Find help'))
map('n', '<leader>u', function() require('snacks').picker.undo() end, addDescription(opts, 'Undo history'))
map('n', 'gst', function() require('snacks').picker.git_status() end, addDescription(opts, 'Git status'))

-- File explorer
map('n', '<leader>nt', function() require('snacks').explorer() end, addDescription(opts, 'Open Neotree'))

-- Split resize
map('n', '<leader>>', '10<C-w>>', addDescription(opts, 'Resize Left'))
map('n', '<leader><', '10<C-w><', addDescription(opts, 'Resize Right'))

-- Quick actions
map('n', '<leader>;', '$a;<Esc>', addDescription(opts, 'fast add ; end line')) --> set ; final line

-- No highlight
map('n', '<leader><ESC>', '<CMD>noh<CR>', addDescription(opts, 'Remove highlight'))

-- Lua
-- map('n', '<leader>xx', '<CMD>TroubleToggle<CR>', addDescription(opts, 'Trouble toggle'))
-- map('n', '<leader>xw', '<CMD>TroubleToggle workspace_diagnostics<CR>', addDescription(opts, 'Trouble toggle workspace'))
-- map('n', '<leader>gl', '<CMD>TroubleToggle document_diagnostics<CR>', addDescription(opts, 'Trouble document'))
map('n', '<leader>gl', '<CMD>Trouble diagnostics toggle filter.buf=0<CR>', addDescription(opts, 'Trouble document'))
-- map('n', '<leader>xl', '<CMD>TroubleToggle loclist<CR>', addDescription(opts, 'Fast quit'))

-- barbar
-- Goto buffer in position...
map('n', '<A-1>', '<CMD>BufferGoto 1<CR>', addDescription(opts, 'Go to buffer 1'))
map('n', '<A-2>', '<CMD>BufferGoto 2<CR>', addDescription(opts, 'Go to buffer 2'))
map('n', '<A-3>', '<CMD>BufferGoto 3<CR>', addDescription(opts, 'Go to buffer 3'))
map('n', '<A-4>', '<CMD>BufferGoto 4<CR>', addDescription(opts, 'Go to buffer 4'))
map('n', '<A-5>', '<CMD>BufferGoto 5<CR>', addDescription(opts, 'Go to buffer 5'))
map('n', '<A-6>', '<CMD>BufferGoto 6<CR>', addDescription(opts, 'Go to buffer 6'))
map('n', '<A-7>', '<CMD>BufferGoto 7<CR>', addDescription(opts, 'Go to buffer 7'))
map('n', '<A-8>', '<CMD>BufferGoto 8<CR>', addDescription(opts, 'Go to buffer 8'))
map('n', '<A-9>', '<CMD>BufferGoto 9<CR>', addDescription(opts, 'Go to buffer 9'))
map('n', '<A-0>', '<Cmd>BufferLast  <CR>', addDescription(opts, 'Go to buffer 0'))

-- Pin/unpin buffer
map('n', '<A-p>', '<CMD>BufferPin<CR>', addDescription(opts, 'Pin buffer'))

-- Close buffer
map('n', '<A-c>', '<CMD>BufferClose<CR>', addDescription(opts, 'Close buffer'))

-- Noice
map('n', '<leader>nl', '<CMD>Noice last<CR>', addDescription(opts, 'Noice last'))
map('n', '<leader>nh', '<CMD>Noice history<CR>', addDescription(opts, 'Noice history'))

-- NavBuddy
map('n', '<leader>nb', '<CMD>Navbuddy<CR>', addDescription(opts, 'NavBuddy explorer'))

-- Project
map('n', '<leader>p', function() require('snacks').picker.projects() end, addDescription(opts, 'Show projects'))

-- Dap
-- map('n', '<F10>', '<CMD>DapStepOver<CR>', addDescription(opts, 'Step Over'))
-- map('n', '<F11>', '<CMD>DapStepInto<CR>', addDescription(opts, 'Step Into'))
-- map('n', '<F12>', '<CMD>DapStepOut<CR>', addDescription(opts, 'Step Out'))
-- map('n', '<Leader>dr', '<CMD>DapToggleRepl<CR>', addDescription(opts, 'Dap Toggle Repl'))
-- map('n', '<Leader>dl', '<CMD>DapRestartFrame<CR>', addDescription(opts, 'Dap Restart Frame'))
-- map({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end, addDescription(opts, 'Dap Hover'))
-- map({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end, addDescription(opts, 'Dap Preview'))
-- map('n', '<Leader>df', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.frames)
-- end, addDescription(opts, 'Dap Frames'))
-- map('n', '<Leader>ds', function()
--   local widgets = require('dap.ui.widgets')
--   widgets.centered_float(widgets.scopes)
-- end, addDescription(opts, 'Dap Scopes'))

-- Rename
-- map('n', '<leader>rn', require("inc_rename").rename , addDescription(opts, 'Lsp variable rename'))
map("n", "<leader>rn", function() return ":IncRename " .. vim.fn.expand("<cword>") end, { expr = true })

-- Legendary
map({ 'n', 'v' }, '<C-p>', '<CMD>Legendary commands<CR>', addDescription(opts, 'Show Legendary'))
