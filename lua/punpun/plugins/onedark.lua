return {
	"navarasu/onedark.nvim",
	event = { "VeryLazy" },
	command = { "colorscheme" },
	config = function()
		vim.cmd.colorscheme("onedark")
		require("onedark").setup({
			style = "darker",
		})
		require("onedark").load()
	end,
}
