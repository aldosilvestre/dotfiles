return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-return>",
        clear_suggestion = "<C-;>",
        accept_word = "<C-l>",
      },
      ignore_filetypes = { cpp = true, c = true },
      ignore_buftypes = { nofile = true, terminal = true, toolbar = true, telescope = true, command = true, prompt = true, cmdLine = true },
      color = {
        suggestion_color = "#646464",
        cterm = 244,
      },
      log_level = "off",
      disable_inline_completion = false, -- disables inline completion for use with cmp
      disable_keymaps = false,            -- disables built in keymaps for more manual control
      condition = function()
        return string.match(vim.fn.expand("%:t"), ":")
      end,
    })
  end
}
