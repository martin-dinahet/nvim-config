vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(shortcut, command, mode)
  if mode == nil then mode = "n" end
  local opts = { noremap = true, silent = true }
  vim.keymap.set(mode, shortcut, "<cmd>" .. command .. "<cr>", opts)
end


map("<esc>", "nohlsearch")
map("<a-d>", "Lspsaga term_toggle", "n")
map("<a-d>", "Lspsaga term_toggle", "t")
map("<leader>f", "Telescope find_files")
map("<leader>ld", "Lspsaga peek_definition")
map("<leader>lt", "Lspsaga peek_type_definition")
map("<leader>lr", "Lspsaga rename")
map("<leader>lf", "Lspsaga finder")

