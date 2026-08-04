return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "|" },
      change = { text = "|" },
      delete = { text = "|" },
      topdelete = { text = "|" },
      changedelete = { text = "|" },
      untracked = { text = "|" },
    },
    on_attach = function(bufnr)
      local helpers = require("config.helpers")
      local gitsigns = require("gitsigns")

      helpers.buf_nmap(bufnr, "]g", gitsigns.next_hunk, "Next git hunk")
      helpers.buf_nmap(bufnr, "[g", gitsigns.prev_hunk, "Previous git hunk")
      helpers.buf_nmap(bufnr, "<leader>g", gitsigns.preview_hunk, "Git hunk")
    end,
  },
}
