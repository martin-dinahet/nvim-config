return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<esc>"] = "close",
					["<C-s>"] = "select_horizontal",
					["<C-v>"] = "select_vertical",
					["<C-t>"] = "select_tab",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
		},
	},
}
