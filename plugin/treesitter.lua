vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" } })

require("nvim-treesitter").install({
	"bash",
	"clojure",
	"css",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"racket",
	"scheme",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	group = require("config.helpers").augroup("treesitter"),
	callback = function()
		if pcall(vim.treesitter.start) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
