vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-q>", "<cmd>close<cr>", { noremap = true, silent = true })

-- -- telescope
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
--
-- -- lsp
-- vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { noremap = true, silent = true })
-- -- shuttle = 'tab' shuttle bettween the finder layout window
-- -- toggle_or_open = 'o' toggle expand or open
-- -- vsplit = 's' open in vsplit
-- -- split = 'i' open in split
-- -- tabe = 't' open in tabe
-- -- tabnew = 'r' open in new tab
-- -- quit = 'q' quit the finder, only works in layout left window
-- -- close = '<C-c>k' close finder
--
-- vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { noremap = true, silent = true })
-- -- quit = 'q' quit the float window
-- -- exec = '<CR>' execute action
--
-- vim.keymap.set("n", "<leader>lpd", "<cmd>Lspsaga peek_definition<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>lpt", "<cmd>Lspsaga peek_type_definition<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>lgd", "<cmd>Lspsaga goto_definition<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>lgt", "<cmd>Lspsaga goto_type_definition<cr>", { noremap = true, silent = true })
-- -- edit = 'o'
-- -- vsplit = 's'
-- -- quit = 'q'
--
-- vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga diagnostic_jump_next<cr>", { noremap = true, silent = true })
--
-- vim.keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", { noremap = true, silent = true })
--
-- vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { noremap = true, silent = true })
-- -- toggle_or_jump = 'o' toggle or jump
-- -- quit = 'q' quit outline window
-- -- jump = 'e' jump to pos even on a expand/collapse node
--
-- vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { noremap = true, silent = true })
-- -- quit = '<C-k>' quit rename window or project_replace window
-- -- exec = '<CR>' execute rename in rename window or execute replace in project_replace window
-- -- select = 'x' select or cancel select item in project_replace float window

