return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.diagnostic.config({
      severity_sort = true,
      float = {
        border = "rounded",
        source = "if_many",
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "E",
          [vim.diagnostic.severity.WARN] = "W",
          [vim.diagnostic.severity.INFO] = "I",
          [vim.diagnostic.severity.HINT] = "H",
        },
      },
      virtual_text = {
        source = "if_many",
        spacing = 2,
      },
    })

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      ts_ls = {},
      eslint = {},
      biome = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      jsonls = {},
    }

    for server, config in pairs(servers) do
      config.capabilities = capabilities
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
