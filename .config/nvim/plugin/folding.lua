vim.pack.add({ 'https://github.com/chrisgrieser/nvim-origami' }, { load = true })

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require("origami").setup()

-- return {
-- 	"chrisgrieser/nvim-origami",
-- 	event = "VeryLazy",
-- 	opts = true, -- needed even when using default config
--
-- 	init = function()
-- 		vim.opt.foldlevel = 99
-- 		vim.opt.foldlevelstart = 99
-- 	end,
-- }
