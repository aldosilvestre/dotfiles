
local loaded = false;

function load()
  if loaded then return end
  loaded = true;

  vim.pack.add({ 'https://github.com/rachartier/tiny-inline-diagnostic.nvim' })

  require("tiny-inline-diagnostic").setup()
  vim.diagnostic.config({ virtual_text = false })
end

vim.api.nvim_create_autocmd({ "LspAttach" }, {
  once = true,
  callback = load,
})
