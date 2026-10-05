return {
	{
		"saghen/blink.cmp",
		dependencies = "saghen/blink.lib",
		build = function()
			require("blink.cmp").build():pwait()
		end,
		opts = {
			keymap = { preset = "super-tab" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			fuzzy = { implementation = "prefer_rust_with_warning" },
			completion = {
				menu = {
					border = "rounded",
					max_height = 10,
					winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection",
					draw = {
						treesitter = { "lsp" },
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
						components = {
							kind_icon = {
								text = function(ctx)
									return ctx.kind_icon .. " "
								end,
								highlight = function(ctx)
									return "BlinkCmpKind" .. ctx.kind
								end,
							},
						},
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "rounded",
						winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
					},
				},
				keyword = { range = "full" },
			},
			signature = {
				enabled = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpSignature,FloatBorder:BlinkCmpSignatureBorder",
				},
			},
		},
	},
}
