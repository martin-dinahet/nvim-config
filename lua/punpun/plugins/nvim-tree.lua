return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "NvimTreeToggle",
  },
  opts = {
    filters = {
      dotfiles = true,
    },
    view = {
      width = 35,
      side = "right",
    },
    renderer = {
      root_folder_label = function()
        return ""
      end,
    }
  },
}
