local M = {}
local function createRandomString()
	local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
	local out = ''
	for i = 1, 16 do
		local idx = math.random(1, #chars);
		out = out .. chars:sub(idx, idx)
	end
	return out;
end


function M.addIncludeguards()
	local buf = vim.api.nvim_get_current_buf()
	local filepath = vim.api.nvim_buf_get_name(buf)
	local extension = vim.fn.fnamemodify(filepath, ":e")
	local ft = vim.bo.ft
	if not (ft == "cpp" and (extension == "h" or extension == "hpp")) then
		print("Not a  h/hpp file")
		return
	end
	local filename = vim.fn.fnamemodify(filepath, ":t:r")
	local randomString = createRandomString()
	local guard = "H_" .. filename:upper() .. "_" .. randomString:upper()

	vim.api.nvim_buf_set_lines(buf, 0, 0, false, {
		"#ifndef " .. guard,
		"#define " .. guard,
		""
	})
	vim.api.nvim_buf_set_lines(buf, -1, -1, false, {
		"#endif // " .. guard,
		""
	})
end

return M
