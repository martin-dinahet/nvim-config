return {
    "catppuccin/nvim",
    name = "catppuccin",
    version = false,
    lazy = false,
    opts = {},
    config = function()
        vim.cmd.colorscheme("catppuccin")
    end
}
