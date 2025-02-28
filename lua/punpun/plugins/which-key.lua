return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    icons = {
      mappings = false,
    },
  },
  config = function()
    require("which-key").add({
      { "<leader>f",   group = "File Operations" },
      { "<leader>ff",  "<cmd>Telescope find_files<cr>",         desc = "Find File",             mode = "n" },
      { "<leader>fg",  "<cmd>Telescope live_grep<cr>",          desc = "Find Word",             mode = "n" },
      { "<leader>fb",  "<cmd>Telescope buffers<cr>",            desc = "Find Buffer",           mode = "n" },

      { "<leader>l",   group = "LSP Actions" },
      { "<leader>lf",  "<cmd>Lspsaga finder<cr>",               desc = "Finder",                mode = "n" },
      { "<leader>la",  "<cmd>Lspsaga code_action<cr>",          desc = "Code Action",           mode = "n" },
      { "<leader>ld",  "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Diagnostics",           mode = "n" },
      { "<leader>lh",  "<cmd>Lspsaga hover_doc<cr>",            desc = "Hover Docs",            mode = "n" },
      { "<leader>lo",  "<cmd>Lspsaga outline<cr>",              desc = "Outline",               mode = "n" },
      { "<leader>lr",  "<cmd>Lspsaga rename<cr>",               desc = "Rename",                mode = "n" },

      { "<leader>lp",  group = "Peek" },
      { "<leader>lpd", "<cmd>Lspsaga peek_definition<cr>",      desc = "Peek Definition",       mode = "n" },
      { "<leader>lpt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Definition",       mode = "n" },

      { "<leader>lg",  group = "Go To" },
      { "<leader>lpd", "<cmd>Lspsaga goto_definition<cr>",      desc = "Go To Definition",      mode = "n" },
      { "<leader>lpt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Go To Type Definition", mode = "n" },
    })
  end
}
