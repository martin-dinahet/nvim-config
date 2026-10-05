-- VS Code style command palette: keymaps, fzf-lua pickers and Ex commands in one list
local M = {}

-- Each entry is "kind \t id \t extra \t display"; fzf only shows the display field
local function entry(kind, id, extra, display)
	return table.concat({ kind, id, extra, display }, "\t")
end

local function keymap_entries(ansi)
	local maps = {}
	for _, map in ipairs(vim.api.nvim_get_keymap("n")) do
		maps[map.lhs] = map
	end
	-- Buffer-local mappings (like LSP ones) override global ones
	for _, map in ipairs(vim.api.nvim_buf_get_keymap(0, "n")) do
		maps[map.lhs] = map
	end

	local entries = {}
	for lhs, map in pairs(maps) do
		local desc = map.desc or map.rhs
		if not lhs:match("^<Plug>") and not lhs:match("^<SNR>") and desc and desc ~= "" then
			local key = vim.fn.keytrans(lhs):gsub("^<Space>", "<leader>")
			table.insert(entries, entry("k", lhs, "", ansi.blue(string.format("%-16s", key)) .. " " .. desc))
		end
	end
	table.sort(entries)
	return entries
end

local function picker_entries(ansi)
	local entries = {}
	for _, name in ipairs(vim.fn.getcompletion("FzfLua ", "cmdline")) do
		table.insert(entries, entry("p", name, "", ansi.magenta(string.format("%-16s", "fzf")) .. " " .. name))
	end
	return entries
end

local function command_entries(ansi)
	local user = vim.api.nvim_get_commands({})
	for name, cmd in pairs(vim.api.nvim_buf_get_commands(0, {})) do
		user[name] = cmd
	end

	local entries = {}
	for _, name in ipairs(vim.fn.getcompletion("", "command")) do
		local cmd = user[name]
		-- Built-in commands have unknown arguments, so they are only pre-filled
		local nargs = cmd and cmd.nargs or "?"
		local desc = cmd and not cmd.definition:match("^<") and cmd.definition or ""
		local label = ansi.yellow(string.format("%-16s", ":" .. name))
		table.insert(entries, entry("c", name, cmd and nargs or "builtin", label .. " " .. desc:sub(1, 80)))
	end
	return entries
end

local function run(line)
	local kind, id, extra = line:match("^(%a)\t([^\t]*)\t([^\t]*)\t")
	if kind == "k" then
		vim.api.nvim_feedkeys(vim.keycode(id), "t", false)
	elseif kind == "p" then
		require("fzf-lua")[id]()
	elseif kind == "c" then
		if extra == "0" or extra == "?" or extra == "*" then
			vim.cmd(id)
		else
			-- Needs arguments: leave it on the command line
			vim.api.nvim_feedkeys(":" .. id .. " ", "n", false)
		end
	end
end

function M.open()
	local fzf = require("fzf-lua")
	local ansi = require("fzf-lua.utils").ansi_codes

	local entries = keymap_entries(ansi)
	vim.list_extend(entries, picker_entries(ansi))
	vim.list_extend(entries, command_entries(ansi))

	fzf.fzf_exec(entries, {
		prompt = "Palette> ",
		previewer = false,
		winopts = { height = 0.5, width = 0.5 },
		fzf_opts = {
			["--delimiter"] = "\t",
			["--with-nth"] = "4..",
			["--tiebreak"] = "index",
			["--no-multi"] = true,
		},
		actions = {
			["enter"] = function(selected)
				if selected[1] then
					vim.schedule(function()
						run(selected[1])
					end)
				end
			end,
		},
	})
end

return M
