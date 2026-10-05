vim.pack.add({ "https://github.com/folke/flash.nvim" })

require("flash").setup({
	modes = {
		char = {
			enabled = false,
		},
	},
})
