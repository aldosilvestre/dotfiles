-- return {
--   'stevearc/conform.nvim',
--   opts = {},
--   init = function()
--     vim.oformatexpr = 'v:lua.require("conform").formatexpr()'
--   end,
--   keys = {
--     {
--       '<leader>f',
--       function()
--         require('conform').format({ lsp_format = 'fallback' })
--       end,
--       desc = 'Format code',
--     },
--   }
-- }

return {}
