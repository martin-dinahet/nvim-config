return {
  'stevearc/oil.nvim',
  opts = {},
  cmd = { "Oil" },
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("oil").setup()
  end,
}
