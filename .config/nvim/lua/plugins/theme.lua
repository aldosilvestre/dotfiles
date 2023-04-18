return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",      -- latte, frappe, macchiato, mocha
			transparent_background = true,
			show_end_of_buffer = false, -- show the '~' characters after the end of buffers
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = { "italic", "bold" },
				functions = { "italic" },
				keywords = { "italic" },
				strings = {},
				variables = { "bold" },
				numbers = {},
				booleans = { "italic" },
				properties = {},
				types = {},
				operators = {},
			},
			integrations = {
				cmp = true,
				gitsigns = true,
				neotree = true,
				mason = true,
				telescope = true,
				notify = true,
				mini = true,
				-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
			}
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
