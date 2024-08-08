local addDescription = require('config.utils').addDescription

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Fast actions
map('n', '<leader>q', '<CMD>q<CR>', addDescription(opts, 'Fast quit'))  --> Quit
map('n', '<leader>w', '<CMD>w<CR>', addDescription(opts, 'Fast write')) --> Save

-- Telescope
map('n', 'ff', '<CMD>Telescope find_files find_command=rg,--ignore,--hidden,--files <CR>', addDescription(opts, 'Find Files'))
map('n', 'fg', '<CMD>Telescope live_grep<CR>', addDescription(opts, 'Find with grep'))
map('n', 'fb', '<CMD>Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>', addDescription(opts, 'Show file browser'))
map('n', 'fh', '<CMD>Telescope help_tags<CR>', addDescription(opts, 'Find help'))
map('n', '<leader>u', '<CMD>Telescope undo<CR>', addDescription(opts, 'Undo history'))
map('n', 'gst', '<CMD>Telescope git_status<CR>', addDescription(opts, 'Git status'))
map('n', 'gsh', '<CMD>Telescope git_stash<CR>', addDescription(opts, 'Git stash'))

-- Neo Tree
map('n', '<leader>nt', '<CMD>Neotree right<CR>', addDescription(opts, 'Open Neotree'))
map('n', '<leader>nf', '<CMD>Neotree float<CR>', addDescription(opts, 'Open Neotree float'))

-- Split resize
map('n', '<leader>>', '10<C-w>>', addDescription(opts, 'Resize Left'))
map('n', '<leader><', '10<C-w><', addDescription(opts, 'Resize Right'))

-- Quick actions
map('n', '<leader>;', '$a;<Esc>', addDescription(opts, 'fast add ; end line')) --> set ; final line

-- No highlight
map('n', '<ESC><ESC>', '<CMD>noh<CR>', addDescription(opts, 'Remove highlight'))

-- Lua
map('n', '<leader>xx', '<CMD>TroubleToggle<CR>', addDescription(opts, 'Trouble toggle'))
map('n', '<leader>xw', '<CMD>TroubleToggle workspace_diagnostics<CR>', addDescription(opts, 'Trouble toggle workspace'))
map('n', '<leader>gl', '<CMD>TroubleToggle document_diagnostics<CR>', addDescription(opts, 'Trouble document'))
map('n', '<leader>xl', '<CMD>TroubleToggle loclist<CR>', addDescription(opts, 'Fast quit'))

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
map('n', '<leader>p', '<CMD>Telescope projects<CR>', addDescription(opts, 'Show projects'))

-- Dap
map('n', '<F10>', '<CMD>DapStepOver<CR>', addDescription(opts, 'Step Over'))
map('n', '<F11>', '<CMD>DapStepInto<CR>', addDescription(opts, 'Step Into'))
map('n', '<F12>', '<CMD>DapStepOut<CR>', addDescription(opts, 'Step Out'))
map('n', '<Leader>dr', '<CMD>DapToggleRepl<CR>', addDescription(opts, 'Dap Toggle Repl'))
map('n', '<Leader>dl', '<CMD>DapRestartFrame<CR>', addDescription(opts, 'Dap Restart Frame'))
map({'n', 'v'}, '<Leader>dh', function()require('dap.ui.widgets').hover()end, addDescription(opts, 'Dap Hover'))
map({'n', 'v'}, '<Leader>dp', function()require('dap.ui.widgets').preview()end, addDescription(opts, 'Dap Preview'))
map('n', '<Leader>df', function()local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames)end, addDescription(opts, 'Dap Frames'))
map('n', '<Leader>ds', function()local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes)end, addDescription(opts, 'Dap Scopes'))

-- Rename
map('n', '<leader>rn', ':IncRename ', addDescription(opts, 'Lsp variable rename'))

-- Hints
map('n', '<leader>h', '<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', addDescription(opts, 'Toggle inlay hints'))
