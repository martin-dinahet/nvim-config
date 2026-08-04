return {
	"saghen/blink.cmp",
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		keymap = {
			preset = "default",
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			keyword = {
				range = "full",
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			menu = {
				border = "rounded",
				scrollbar = false,
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
				},
			},
			ghost_text = {
				enabled = true,
			},
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
