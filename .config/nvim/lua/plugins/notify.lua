return {
  "rcarriga/nvim-notify",
  config = function()
    local success, notify = pcall(require, 'notify')
    if not success then return end

    notify.setup({
      stages = "fade",
      top_down = false
    })

    vim.cmd.highlight 'NotifyERRORBody guibg=transparent'
    vim.cmd.highlight 'NotifyERRORBody guibg=transparent'
    vim.cmd.highlight 'NotifyWARNBody guibg=transparent'
    vim.cmd.highlight 'NotifyINFOBody guibg=transparent'
    vim.cmd.highlight 'NotifyDEBUGBody guibg=transparent'
    vim.cmd.highlight 'NotifyTRACEBody guibg=transparent'

    vim.opt.termguicolors = true
    vim.notify = notify.notify
  end
}
