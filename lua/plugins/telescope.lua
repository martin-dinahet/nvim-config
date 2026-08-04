return {
  "nvim-telescope/telescope.nvim", 
  version = "*",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = "close",
          ["<C-s>"] = "select_horizontal",
          ["<C-v>"] = "select_vertical",
          ["<C-t>"] = "select_tab",
        },
        n = {
          ["s"] = "select_horizontal",
          ["v"] = "select_vertical",
          ["t"] = "select_tab",
        }
      }
    }
  }
}
