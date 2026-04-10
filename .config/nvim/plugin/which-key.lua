local loaded = false

local function load_which_key()
  if not loaded then
    vim.pack.add({ "https://github.com/folke/which-key.nvim" })
    loaded = true
    require("which-key").setup {
      preset = "helix",
      icons = {
        rules = false,
      },
    }
  end
end

vim.api.nvim_create_user_command('WhichKey', function(opts)
  load_which_key()
  vim.cmd('WhichKey ' .. (opts.args or ''))
end, { nargs = "*" })
