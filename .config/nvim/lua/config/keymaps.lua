local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' ' --> leader blankspace

map('n', '<leader>q', ':q<CR>', opts) --> fast quit
map('n', '<leader>w', ':w<CR>', opts) --> fast save

map('n', '<leader>nt', ':Neotree right<CR>', opts)
map('n', '<leader>nf', ':Neotree float<CR>', opts)

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', 'gst', ':Telescope git_status<CR>', opts)
map('n', 'gsh', ':Telescope git_stash<CR>', opts)

-- Fast scrolling
map('n', '<C-e>', '10<C-e>', opts)
map('n', '<C-y>', '10<C-y>', opts)

-- Split resize
map('n', '<leader>>', '10<C-w>>', opts)
map('n', '<leader><', '10<C-w><', opts)

-- Quick actions
map('n', '<leader>;', '$a;<Esc>', opts) --> set ; final line

-- Move line
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)

-- Git Blame
map('n', 'gb', ':GitBlameToggle<CR>', opts)

-- Diagnostics
map('n', '<leader>e', '<CMD>lua vim.diagnostic.open_float({border = "rounded"})<CR>', opts)
map('n', '[d', '<CMD>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<CMD>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<leader>E', '<CMD>lua vim.diagnostic.setloclist()<CR>', opts)

-- Lua
map("n", "<leader>xx", "<CMD>TroubleToggle<CR>", opts)
map("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>gl", "<CMD>TroubleToggle document_diagnostics<CR>", opts)
map("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>", opts)
map("n", "<leader>xf", "<CMD>TroubleToggle quickfix<CR>", opts)
map("n", "gr", "<CMD>Trouble lsp_references<CR>", opts)
map("n", "gd", "<CMD>Trouble lsp_definitions<CR>", opts)

-- barbar
-- Goto buffer in position...
map('n', '<A-1>', '<CMD>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<CMD>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<CMD>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<CMD>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<CMD>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<CMD>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<CMD>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<CMD>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<CMD>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<CMD>BufferPin<CR>', opts)

-- Close buffer
map('n', '<A-c>', '<CMD>BufferClose<CR>', opts)

-- SplitJoin
map('n', 'gs', '<CMD>SplitjoinSplit<CR>', opts)
map('n', 'gj', '<CMD>SplitjoinJoin<CR>', opts)

-- Hop
map('n', '<leader>s', '<CMD>HopPattern<CR>', opts)

-- Noice
map("n", "<leader>nl", "<CMD>Noice last<CR>", opts)
map("n", "<leader>nh", "<CMD>Noice history<CR>", opts)
