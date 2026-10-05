return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
	},
	opts = {
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = false,
		default_component_configs = {
			icon = {
				folder_closed = "*",
				folder_open = "*",
				folder_empty = "*",
				folder_empty_open = "*",
				default = "*",
				provider = nil,
			},
			indent = {
				with_expanders = false,
			},
		},
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = {
				enabled = true,
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			use_libuv_file_watcher = true,
		},
		window = {
			width = 32,
			mappings = {
				["s"] = "open_split",
				["v"] = "open_vsplit",
				["t"] = "open_tabnew",
			},
		},
	},
}
