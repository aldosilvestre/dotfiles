return {
  "michaelb/sniprun", --> Run code
  build = "sh ./install.sh",
  cmd = "SnipRun",
  config = function()
    require 'sniprun'.setup({
      display = { "Classic" },
      borders = "rounded"
    })
  end
}
