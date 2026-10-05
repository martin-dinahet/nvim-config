vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup()

local map = require("config.helpers").map

map("n", "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", "Buffer diagnostics")
