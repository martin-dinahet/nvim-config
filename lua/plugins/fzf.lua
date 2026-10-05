return {
	"ibhagwan/fzf-lua",
	lazy = false,
	keys = {
		{ "<leader>f", "<cmd>FzfLua files<CR>", desc = "Find files" },
		{ "<leader>g", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
		{ "<leader>b", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
		{ "<leader>d", "<cmd>FzfLua diagnostics_document<CR>", desc = "Diagnostics" },
	},
	opts = {
		defaults = {
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
					["<C-s>"] = "toggle-preview-wrap",
				},
				fzf = {
					["esc"] = "abort",
					["ctrl-s"] = "select-all+accept",
					["ctrl-v"] = "accept",
					["ctrl-t"] = "accept",
				},
			},
		},
		files = {
			previewer = true,
		},
		grep = {
			previewer = "bat",
		},
	},
}
