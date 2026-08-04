return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "ts_ls",
      "eslint",
      "biome",
      "html",
      "cssls",
      "tailwindcss",
      "jsonls",
    },
    automatic_enable = false,
  },
}
