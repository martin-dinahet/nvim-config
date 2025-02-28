return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  -- opts = {
  --   extensions = {
  --     fzf = {
  --       fuzzy = true,
  --       override_generic_sorter = true,
  --       override_file_sorter = true,
  --       case_mode = "smartcase",
  --     },
  --   },
  --   defaults = {
  --     path_display = {},
  --     mappings = {
  --       i = {
  --         ["<esc>"] = "close",
  --       },
  --     },
  --     file_ignore_patterns = {
  --       "node_modules",
  --     },
  --   },
  --   pickers = {
  --     find_files = {
  --       theme = "dropdown",
  --       previewer = false,
  --     },
  --   },
  -- },
  config = function()
    require("telescope").load_extension("fzf")
    require("telescope").setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smartcase",
        },
      },
      defaults = {
        path_display = {},
        mappings = {
          i = {
            ["<esc>"] = "close",
          },
        },
        file_ignore_patterns = {
          "node_modules",
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })
  end,
}
