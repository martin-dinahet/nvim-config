local map = require("config.helpers").map
local nmap = require("config.helpers").nmap
local telescope = require("telescope.builtin")

nmap("<leader>f", telescope.find_files, "Find files")
nmap("<leader>G", telescope.live_grep, "Grep")
nmap("<leader>e", "<cmd>Neotree toggle reveal position=left<cr>", "File tree")
nmap("<leader>E", "<cmd>Neotree toggle position=left<cr>", "File tree cwd")
nmap("<leader>d", "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics")
nmap("<leader>b", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer diagnostics")
nmap("<leader>s", "<cmd>Trouble symbols toggle<cr>", "Symbols")
nmap("<leader>l", "<cmd>Trouble lsp toggle<cr>", "LSP")
nmap("<leader>o", "<cmd>Trouble loclist toggle<cr>", "Location list")
nmap("<leader>q", "<cmd>Trouble qflist toggle<cr>", "Quickfix list")

nmap("<leader>x", function()
	require("mini.bufremove").delete(0, false)
end, "Delete buffer")

map({ "n", "v" }, "<leader>c", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, "Format")

map({ "n", "x", "o" }, "f", function()
	require("flash").jump()
end, "Flash")

map({ "n", "x", "o" }, "F", function()
  require("flash").treesitter()
end, "Flash treesitter")

map("x", "m", "<esc><cmd>lua require('config.selection').expand()<cr>", "Expand selection")
