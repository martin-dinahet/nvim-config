return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        code_action = ''
      },
      finder = {
        keys = {
          shuttle = "<tab>",
          toggle_or_open = "<cr>",
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
