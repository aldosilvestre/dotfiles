local success, cinnamon = pcall(require, 'cinnamon')

if not success then return end

cinnamon.setup {
  extra_keymaps = true,
  override_keymaps = true,
  max_length = 500,
  scroll_limit = -1,
}
