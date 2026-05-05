local loaded = false;

vim.filetype.add {
  extension = {
    njk = 'html.jinja',
  }
}

function load()
  if loaded then return end

  loaded = true;
  vim.pack.add { 'https://github.com/Glench/Vim-Jinja2-Syntax' }
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "html.jinja",
  callback = load,
})
