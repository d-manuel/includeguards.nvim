local module       = require("includeguards.module")
local M            = {}
M.options          = {}

M.setup            = function(options)
	M.options = vim.tbl_deep_extend("force", M.options, options or {})
end

M.addIncludeguards = function()
	module.addIncludeguards()
end

return M
