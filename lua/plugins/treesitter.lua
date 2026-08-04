local languages = {
  "bash",
  "css",
  "html",
  "javascript",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    require("nvim-treesitter").install(languages):wait(300000)
  end,
  opts = {
    languages = languages,
  },
  config = function(_, opts)
    require("nvim-treesitter").setup()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = opts.languages,
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
