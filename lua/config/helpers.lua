local M = {}

function M.map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

function M.nmap(lhs, rhs, desc, opts)
	M.map("n", lhs, rhs, desc, opts)
end

function M.buf_nmap(bufnr, lhs, rhs, desc)
	M.nmap(lhs, rhs, desc, { buffer = bufnr })
end

function M.augroup(name)
	return vim.api.nvim_create_augroup("config-" .. name, { clear = true })
end

return M
