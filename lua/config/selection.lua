local M = {}

local function contains(node, start_row, start_col, end_row, end_col)
	local node_start_row, node_start_col, node_end_row, node_end_col = node:range()

	local starts_before = node_start_row < start_row or node_start_row == start_row and node_start_col <= start_col
	local ends_after = node_end_row > end_row or node_end_row == end_row and node_end_col >= end_col

	return starts_before and ends_after
end

local function visual_range(node)
	local start_row, start_col, end_row, end_col = node:range()
	if end_col == 0 and end_row > start_row then
		end_row = end_row - 1
		end_col = #vim.api.nvim_buf_get_lines(0, end_row, end_row + 1, false)[1] + 1
	end

	return start_row, start_col, end_row, math.max(end_col - 1, 0)
end

local function range_size(range)
	return (range.end_row - range.start_row) * 100000 + (range.end_col - range.start_col)
end

local function find_expand_range(root, start_row, start_col, end_row, end_col)
	local ranges = {}
	local seen = {}

	local function visit(node)
		if not contains(node, start_row, start_col, end_row, end_col) then
			return
		end

		if node:type() ~= "program" and node:named() then
			local node_start_row, node_start_col, node_end_row, node_end_col = visual_range(node)
			local key = table.concat({ node_start_row, node_start_col, node_end_row, node_end_col }, ":")

			if not seen[key] then
				seen[key] = true
				ranges[#ranges + 1] = {
					start_row = node_start_row,
					start_col = node_start_col,
					end_row = node_end_row,
					end_col = node_end_col,
				}
			end
		end

		for child in node:iter_children() do
			visit(child)
		end
	end

	visit(root)

	table.sort(ranges, function(a, b)
		local a_size = range_size(a)
		local b_size = range_size(b)
		if a_size == b_size then
			if a.start_row == b.start_row then
				return a.start_col > b.start_col
			end
			return a.start_row > b.start_row
		end
		return a_size < b_size
	end)

	for _, range in ipairs(ranges) do
		if
			range.start_row ~= start_row
			or range.start_col ~= start_col
			or range.end_row ~= end_row
			or range.end_col ~= end_col - 1
		then
			return range
		end
	end
end

function M.expand()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	if start_pos[2] == 0 or end_pos[2] == 0 then
		return
	end

	local start_row = start_pos[2] - 1
	local start_col = start_pos[3] - 1
	local end_row = end_pos[2] - 1
	local end_col = end_pos[3]

	if start_row > end_row or start_row == end_row and start_col > end_col then
		start_row, end_row = end_row, start_row
		start_col, end_col = end_col, start_col
	end

	local ok, parser = pcall(vim.treesitter.get_parser, 0)
	if not ok or not parser then
		vim.notify("No Treesitter parser for this buffer", vim.log.levels.WARN)
		return
	end

	local tree = parser:parse()[1]
	if not tree then
		return
	end

	local range = find_expand_range(tree:root(), start_row, start_col, end_row, end_col)
	if not range then
		return
	end

	vim.fn.setpos("'<", { 0, range.start_row + 1, range.start_col + 1, 0 })
	vim.fn.setpos("'>", { 0, range.end_row + 1, range.end_col + 1, 0 })
	vim.cmd("normal! `<v`>")
end

return M
