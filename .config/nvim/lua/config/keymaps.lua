local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

function addDescription(table, desc)
  table['desc'] = desc
  return table
end

map('n', '<leader>q', '<CMD>q<CR>', addDescription(opts, "Fast quit")) --> fast quit
map('n', '<leader>w', '<CMD>w<CR>', addDescription(opts, "Fast write")) --> fast save

map('n', '<leader>nt', '<CMD>Neotree right<CR>', addDescription(opts, "Open Neotree"))
map('n', '<leader>nf', '<CMD>Neotree float<CR>', addDescription(opts, "Open Neotree float"))

-- Telescope
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', addDescription(opts, "Find Files"))
map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>', addDescription(opts, "Find with grep"))
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', addDescription(opts, "Show buffers"))
map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', addDescription(opts, "Find help"))
map('n', 'gst', '<CMD>Telescope git_status<CR>', addDescription(opts, "Git status"))
map('n', 'gsh', '<CMD>Telescope git_stash<CR>', addDescription(opts, "Git stash"))

-- Split resize
map('n', '<leader>>', '10<C-w>>', addDescription(opts, "Resize Left"))
map('n', '<leader><', '10<C-w><', addDescription(opts, "Resize Right"))

-- Quick actions
map('n', '<leader>;', '$a;<Esc>', addDescription(opts, "fast add ; end line")) --> set ; final line

-- Move line
map('n', '<A-j>', '<CMD>m .+1<CR>==', addDescription(opts, "Move line down"))
map('n', '<A-k>', '<CMD>m .-2<CR>==', addDescription(opts, "Move line up"))

-- Git Blame
map('n', 'gb', '<CMD>GitBlameToggle<CR>', addDescription(opts, "Git brame toggle"))

-- Diagnostics
map('n', '<leader>e', '<CMD>lua vim.diagnostic.open_float({border = "rounded"})<CR>', addDescription(opts, "Open diagnostic float"))
map('n', '<leader>E', '<CMD>lua vim.diagnostic.setloclist()<CR>', addDescription(opts, "Diagnostics location"))

-- Lua
map("n", "<leader>xx", "<CMD>TroubleToggle<CR>", addDescription(opts, "Trouble toggle"))
map("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", addDescription(opts, "Trouble toggle workspace"))
map("n", "<leader>gl", "<CMD>TroubleToggle document_diagnostics<CR>", addDescription(opts, "Trouble document"))
map("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>", addDescription(opts, "Fast quit"))
map("n", "gr", "<CMD>Trouble lsp_references<CR>", addDescription(opts, "Show references"))
map("n", "gd", "<CMD>Trouble lsp_definitions<CR>", addDescription(opts, "Show definitions"))

-- barbar
-- Goto buffer in position...
map('n', '<A-1>', '<CMD>BufferGoto 1<CR>', addDescription(opts, "Go to buffer 1"))
map('n', '<A-2>', '<CMD>BufferGoto 2<CR>', addDescription(opts, "Go to buffer 2"))
map('n', '<A-3>', '<CMD>BufferGoto 3<CR>', addDescription(opts, "Go to buffer 3"))
map('n', '<A-4>', '<CMD>BufferGoto 4<CR>', addDescription(opts, "Go to buffer 4"))
map('n', '<A-5>', '<CMD>BufferGoto 5<CR>', addDescription(opts, "Go to buffer 5"))
map('n', '<A-6>', '<CMD>BufferGoto 6<CR>', addDescription(opts, "Go to buffer 6"))
map('n', '<A-7>', '<CMD>BufferGoto 7<CR>', addDescription(opts, "Go to buffer 7"))
map('n', '<A-8>', '<CMD>BufferGoto 8<CR>', addDescription(opts, "Go to buffer 8"))
map('n', '<A-9>', '<CMD>BufferGoto 9<CR>', addDescription(opts, "Go to buffer 9"))
map('n', '<A-0>', '<Cmd>BufferLast<CR>', addDescription(opts, "Go to buffer 0"))

-- Pin/unpin buffer
map('n', '<A-p>', '<CMD>BufferPin<CR>', addDescription(opts, "Pin buffer"))

-- Close buffer
map('n', '<A-c>', '<CMD>BufferClose<CR>', addDescription(opts, "Close buffer"))

-- Hop
map('n', '<leader>s', '<CMD>HopPattern<CR>', addDescription(opts, "Fast Hop"))

-- Noice
map("n", "<leader>nl", "<CMD>Noice last<CR>", addDescription(opts, "Noice last"))
map("n", "<leader>nh", "<CMD>Noice history<CR>", addDescription(opts, "Noice history"))

-- NavBuddy
map("n", "<leader>nb", "<CMD>Navbuddy<CR>", addDescription(opts, "NavBuddy explorer"))

