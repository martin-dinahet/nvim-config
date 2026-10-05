vim.pack.add({
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.move",
	"https://github.com/nvim-mini/mini.splitjoin",
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.comment",
	"https://github.com/nvim-mini/mini.bufremove",
})

require("mini.ai").setup()
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.bufremove").setup()
