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
	-- Respect .gitignore outside git repos too, and always skip node_modules
	files = {
		previewer = true,
		fd_opts = "--color=never --type f --type l --exclude .git --exclude .jj --exclude node_modules --no-require-git",
		rg_opts = [[--color=never --files -g "!.git" -g "!.jj" -g "!node_modules" --no-require-git]],
	},
	grep = {
		previewer = "bat",
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 "
			.. '-g "!node_modules" --no-require-git -e',
	},
})

local map = require("config.helpers").map

map("n", "<leader>f", "<cmd>FzfLua files<CR>", "Find files")
map("n", "<leader>g", "<cmd>FzfLua live_grep<CR>", "Live grep")
map("n", "<leader>b", "<cmd>FzfLua buffers<CR>", "Buffers")
map("n", "<leader>p", function()
	require("config.palette").open()
end, "Command palette")
map("n", "<leader>S", "<cmd>FzfLua lsp_live_workspace_symbols<CR>", "Workspace symbols")
