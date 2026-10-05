vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	signs = {
		add = { text = "|" },
		change = { text = "|" },
		delete = { text = "|" },
		topdelete = { text = "|" },
		changedelete = { text = "|" },
		untracked = { text = "|" },
	},
	on_attach = function(bufnr)
		local helpers = require("config.helpers")
		local gitsigns = require("gitsigns")

		helpers.buf_nmap(bufnr, "]g", function()
			gitsigns.nav_hunk("next")
		end, "Next git hunk")
		helpers.buf_nmap(bufnr, "[g", function()
			gitsigns.nav_hunk("prev")
		end, "Previous git hunk")
		helpers.buf_nmap(bufnr, "<leader>hp", gitsigns.preview_hunk, "Preview git hunk")
	end,
})
