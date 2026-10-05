vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
	},
})

vim.api.nvim_set_hl(0, "FloatBorder", { link = "BlinkCmpMenuBorder" })
vim.api.nvim_set_hl(0, "NormalFloat", { link = "BlinkCmpMenu" })

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
		},
	},
})

-- Neovim provides K, grn, gra, grr, gri, grt, [d and ]d by default
vim.api.nvim_create_autocmd("LspAttach", {
	group = require("config.helpers").augroup("lsp-attach"),
	callback = function(ev)
		local helpers = require("config.helpers")
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		helpers.buf_nmap(ev.buf, "gd", vim.lsp.buf.definition, "Go to definition")
		helpers.buf_nmap(ev.buf, "g.", vim.lsp.buf.code_action, "Code action")

		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		end
	end,
})
