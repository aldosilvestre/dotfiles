-- return {
--   "michaelb/sniprun", --> Run code
--   build = "sh ./install.sh",
--   cmd = "SnipRun",
--   config = function()
--     require 'sniprun'.setup({
--       display = { "Classic" },
--       borders = "rounded"
--     })
--   end
-- }


return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh install.sh",
  config = function()
    require("sniprun").setup({
      selected_interpreters = { "JS_TS_bun" },
      repl_enable = { "JS_TS_bun" },
      interpreter_options = {
        JS_TS_bun = {
          bun_run_opts = "--smol"
        }
      },
      display = {
        -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

        -- "VirtualText",             --# display results as virtual text
        -- "TempFloatingWindow",      --# display results in a floating window
        -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
        -- "Terminal",                --# display results in a vertical split
        -- "TerminalWithCode",        --# display results and code history in a vertical split
        "NvimNotify", --# display with the nvim-notify plugin
        -- "Api"                      --# return output to a programming interface
      },
      borders = "rounded"
    })
  end,
}
