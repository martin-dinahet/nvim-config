return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		config = function()
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
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"stylua",
				},
			})

			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local set = vim.keymap.set
				set("n", "gd", vim.lsp.buf.definition, opts)
				set("n", "gd", vim.lsp.buf.type_definition, opts)
				set("n", "gi", vim.lsp.buf.implementation, opts)
				set("n", "gr", vim.lsp.buf.rename, opts)
				set("n", "g.", vim.lsp.buf.code_action, opts)
				set("n", "[d", vim.diagnostic.goto_prev, opts)
				set("n", "]d", vim.diagnostic.goto_next, opts)
				set("n", "K", vim.lsp.buf.hover, opts)

				if client.supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})

			vim.lsp.util.open_floating_preview = (function(orig)
				return function(contents, syntax, opts, ...)
					opts = opts or {}
					opts.border = opts.border or "rounded"
					return orig(contents, syntax, opts, ...)
				end
			end)(vim.lsp.util.open_floating_preview)
			vim.api.nvim_set_hl(0, "FloatBorder", { link = "BlinkCmpMenuBorder" })
			vim.api.nvim_set_hl(0, "NormalFloat", { link = "BlinkCmpMenu" })

			vim.lsp.config("*", {
				capabilities = capabilities,
				on_attach = on_attach,
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

			vim.lsp.config("biome", {
				cmd = { "biome", "lsp-proxy" },
				root_markers = { "biome.json", "biome.jsonc" },
				capabilities = capabilities,
				on_attach = on_attach,
			})

			vim.lsp.config("eslint", {
				cmd = { "vscode-eslint-language-server", "--stdio" },
				root_markers = {
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					"eslint.config.js",
					"package.json",
				},
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},
}
