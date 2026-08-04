return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "stylua",
      "biome",
      "prettierd",
      "prettier",
    },
    auto_update = false,
    run_on_start = true,
  },
}
