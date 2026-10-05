local helpers = require("config.helpers")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = helpers.augroup("highlight-yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function(event)
		vim.keymap.set("i", "<Tab>", function()
			local line = vim.api.nvim_get_current_line()
			local col = vim.api.nvim_win_get_cursor(0)[2]
			local char_after = line:sub(col + 1, col + 1)

			if
				char_after == '"'
				or char_after == "'"
				or char_after == ")"
				or char_after == "]"
				or char_after == "}"
			then
				vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col + 1 })
			else
				vim.api.nvim_feedkeys("\t", "n", false)
			end
		end, { buffer = event.buf })
	end,
})
