local M = {}

local state = { active = false, delimiter = nil }

local function enable(delim)
	state = { active = true, delimiter = delim }

	vim.api.nvim_create_autocmd("InsertCharPre", {
		callback = function()
			if vim.v.char == " " then
				vim.v.char = state.delimiter
			end
		end,
	})
end

function M.start()
	M.active = true

	delim = vim.fn.getcharstr()

	if delim == "\27" then
		return
	end

	enable(delim)

	if vim.api.nvim_get_mode().mode ~= "i" then
		vim.cmd("startinsert")
	end
end

return M
