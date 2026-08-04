return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    focus = true,
    auto_close = true,
    indent_guides = false,
    icons = {
      indent = {
        top = "  ",
        middle = "  ",
        last = "  ",
        fold_open = "- ",
        fold_closed = "+ ",
        ws = "  ",
      },
      folder_closed = "",
      folder_open = "",
      kinds = {},
    },
    modes = {
      diagnostics = {
        auto_open = false,
      },
    },
  },
}
