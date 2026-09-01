return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function(_, opts)
		require("nvim-treesitter").setup()

		vim.api.nvim_create_autocmd("FileType", {
			pattern = opts.languages,
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
