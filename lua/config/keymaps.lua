local map = require("config.helpers").map

map("n", "<leader>x", function()
	require("mini.bufremove").delete(0, false)
end, "Delete buffer")

map("n", "<leader>s", function()
	require("flash").jump()
end, "Flash treesitter")

map("x", "m", function()
	require("config.selection").expand()
end, "Expand selection")
