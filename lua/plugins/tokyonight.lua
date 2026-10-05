return {
	"folke/tokyonight.nvim",
	version = false,
	lazy = false,
	opts = {},
	config = function()
		vim.cmd.colorscheme("tokyonight-night")
	end,
}
