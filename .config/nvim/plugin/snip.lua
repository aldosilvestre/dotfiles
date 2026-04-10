vim.pack.add({
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/dsznajder/vscode-es7-javascript-react-snippets',
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    version = vim.version.range('2.*'),
    build = "make install_jsregexp",
  },
})

require("luasnip.loaders.from_vscode").lazy_load()
