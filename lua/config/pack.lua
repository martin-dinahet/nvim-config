local M = {}

-- Build steps that need the plugin (and its dependencies) loaded. On first
-- install plugins are cloned in parallel and not yet on 'runtimepath', so the
-- build is deferred until the plugin file calls `M.run_pending()`.
local builds = {
	["blink.cmp"] = function()
		require("blink.cmp").build():pwait()
	end,
}

local pending = {}

function M.run_pending(name)
	if pending[name] then
		pending[name] = nil
		builds[name]()
	end
end

vim.api.nvim_create_autocmd("PackChanged", {
	group = require("config.helpers").augroup("pack-hooks"),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		if builds[name] and (kind == "install" or kind == "update") then
			pending[name] = true
			if ev.data.active then
				M.run_pending(name)
			end
		end

		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

return M
