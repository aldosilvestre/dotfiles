local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>q', ':q<CR>', opts)
map('n', '<leader>w', ':w<CR>', opts)

-- Packer
map('n', "<leader>pc", "<cmd>PackerCompile<cr>", opts)
map('n', "<leader>pi", "<cmd>PackerInstall<cr>", opts)
map('n', "<leader>ps", "<cmd>PackerSync<cr>", opts)
map('n', "<leader>pS", "<cmd>PackerStatus<cr>", opts)
map('n', "<leader>pu", "<cmd>PackerUpdate<cr>", opts)

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
-- set ; final line
map('n', '<leader>;', '$a;<Esc>', opts)

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
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", opts)
map("n", "<leader>gl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<leader>xf", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- color picker
map("n", "<C-c>", "<cmd>PickColor<cr>", opts)
map("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)


