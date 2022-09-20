local success, lualine = pcall(require, 'lualine')

if not success then
  return
end

lualine.setup {
  options = {
    section_separators = { left = '', right = ''}, 
    component_separators = '',
    theme = 'fluoromachine'
  }
}


--[[require'lualine'.setup({
    options = {
        section_separators = { left = '', right = ''}, 
        component_separators = ''
    }
})]]
