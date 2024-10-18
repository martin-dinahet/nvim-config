return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<esc>"] = "close",
				},
			},
			file_ignore_patterns = {
				"node_modules",
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
			},
		},
	},
}
