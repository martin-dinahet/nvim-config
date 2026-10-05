vim.pack.add({
	"https://github.com/saghen/blink.lib",
	{ src = "https://github.com/saghen/blink.cmp", version = "main" },
})
require("config.pack").run_pending("blink.cmp")

-- Jump over a closing quote/bracket when there is nothing to complete
local function tab_out()
	local line = vim.api.nvim_get_current_line()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	if line:sub(col + 1, col + 1):match("[\"')%]}]") then
		vim.api.nvim_win_set_cursor(0, { row, col + 1 })
		return true
	end
end

require("blink.cmp").setup({
	keymap = {
		preset = "super-tab",
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			tab_out,
			"fallback",
		},
	},
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
})
