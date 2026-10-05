vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
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
})

local map = require("config.helpers").map

map("n", "<leader>f", "<cmd>FzfLua files<CR>", "Find files")
map("n", "<leader>g", "<cmd>FzfLua live_grep<CR>", "Live grep")
map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", "Buffers")
map("n", "<leader>S", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", "Workspace symbols")
