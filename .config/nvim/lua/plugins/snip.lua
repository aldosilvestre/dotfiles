return {
  "L3MON4D3/LuaSnip",
  event = "LspAttach",
  -- follow latest release.
  version = "v2.*",   -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = {
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'dsznajder/vscode-es7-javascript-react-snippets',
  }
}
