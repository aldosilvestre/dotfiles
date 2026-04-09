-- local lombok_path = vim.fn.expand("~/.local/share/nvim/mason/share/lombok-nightly/lombok.jar")

-- return {
  -- "nvim-java/nvim-java",
-- }

-- return {
--   "nvim-java/nvim-java",
--   config = false,
--   dependencies = {
--     {
--       "neovim/nvim-lspconfig",
--       opts = {
--         servers = {
--           jdtls = {
--             -- your jdtls configuration goes here
--             cmd = { "jdtls", "--jvm-arg=" .. "-javaagent:" .. lombok_path },
--             -- cmd = { "jdtls", "-javaagent:" .. lombok_path }
--           },
--         },
--       },
--       config = function()
--         jdtls = function()
--           require("java").setup({
--
--             servers = {
--               jdtls = {
--                 -- your jdtls configuration goes here
--                 cmd = { "jdtls", "--jvm-arg=" .. "-javaagent:" .. lombok_path },
--                 -- cmd = { "jdtls", "-javaagent:" .. lombok_path }
--               },
--             }
--
--           })
--           require('lspconfig').jdtls.setup({})
--         end
--       end
--     },
--   },
return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup()
  end,
}
