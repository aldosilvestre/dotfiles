return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require('project_nvim').setup({
      show_hidden = true,
      exclude_dirs = { ".git", "node_modules", ".cache" }
    })
  end
}
