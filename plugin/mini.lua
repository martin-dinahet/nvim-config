-- Only the modules set up below are active
vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	-- Treesitter queries for mini.ai's function/class textobjects
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

local ai = require("mini.ai")
ai.setup({
	custom_textobjects = {
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		u = ai.gen_spec.function_call(),
	},
})
require("mini.pairs").setup()
require("mini.move").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.bufremove").setup()
