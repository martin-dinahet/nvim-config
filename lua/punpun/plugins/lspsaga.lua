return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = " "
      },
      symbol_in_winbar = {
        enable = false,
      },
      finder = {
        keys = {
          shuttle = "<tab>",
          toggle_or_open = "o",
        },
      },
      definition = {
        keys = {
          edit = "o",
          vsplit = "s"
        }
      },
      diagnostic = {
        show_code_action = false,
      },
      rename = {
        keys = {
          quit = "q",
        }
      },
    })
  end,
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
