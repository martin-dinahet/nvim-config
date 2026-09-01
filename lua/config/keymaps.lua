local map = require("config.helpers").map
local nmap = require("config.helpers").nmap
local telescope = require("telescope.builtin")

nmap("<leader>f", "<cmd>Telescope find_files<cr>", "Find files")
nmap("<leader>g", "<cmd>Telescope live_grep<cr>", "Grep")
nmap("<leader>e", "<cmd>Neotree toggle reveal position=left<cr>", "File tree")

nmap("<leader>x", function()
	require("mini.bufremove").delete(0, false)
end, "Delete buffer")

map({ "n", "x", "o" }, "f", function()
	require("flash").jump()
end, "Flash")

map({ "n", "x", "o" }, "F", function()
	require("flash").treesitter()
end, "Flash treesitter")

map("x", "m", "<esc><cmd>lua require('config.selection').expand()<cr>", "Expand selection")
