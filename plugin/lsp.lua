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

-- Neovim also provides [d and ]d for diagnostics by default
vim.api.nvim_create_autocmd("LspAttach", {
	group = require("config.helpers").augroup("lsp-attach"),
	callback = function(ev)
		local helpers = require("config.helpers")
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		helpers.buf_nmap(ev.buf, "gd", vim.lsp.buf.definition, "Go to definition")
		helpers.buf_nmap(ev.buf, "g.", vim.lsp.buf.code_action, "Code action")

		-- Neovim's default LSP keymaps, redefined with readable descriptions
		helpers.buf_nmap(ev.buf, "K", vim.lsp.buf.hover, "Hover documentation")
		helpers.buf_nmap(ev.buf, "grn", vim.lsp.buf.rename, "Rename symbol")
		helpers.buf_nmap(ev.buf, "gra", vim.lsp.buf.code_action, "Code action")
		helpers.buf_nmap(ev.buf, "grr", vim.lsp.buf.references, "Go to references")
		helpers.buf_nmap(ev.buf, "gri", vim.lsp.buf.implementation, "Go to implementation")
		helpers.buf_nmap(ev.buf, "grt", vim.lsp.buf.type_definition, "Go to type definition")
		helpers.buf_nmap(ev.buf, "grx", vim.lsp.codelens.run, "Run code lens")
		helpers.buf_nmap(ev.buf, "gO", vim.lsp.buf.document_symbol, "Document symbols")

		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		end
	end,
})
