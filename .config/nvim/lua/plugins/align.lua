return {
  'Vonr/align.nvim',
  branch = 'v2',
  keys   = {
    { "ga",            function() require 'align'.align_to_char({ length = 1 }) end, mode = "v", desc = "Align" },
    { "<Leader>ga",    function() require 'align'.align_to_char({ length = 1 }) end, mode = "n", desc = "Align" }
  }
}
