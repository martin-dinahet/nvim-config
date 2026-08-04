local helpers = require("config.helpers")

vim.api.nvim_create_autocmd("TextYankPost", {
  group = helpers.augroup("highlight-yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
