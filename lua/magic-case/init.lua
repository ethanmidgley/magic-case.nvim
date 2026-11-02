local M = {}

local state = { active = false, delimiter = nil }
local augroup = vim.api.nvim_create_augroup("magic-case", { clear = true })

local function disable()
	vim.api.nvim_clear_autocmds({ group = augroup })
	state = { active = false, delimter = nil }
end

local function enable(delim)
	state = { active = true, delimiter = delim }

	vim.api.nvim_create_autocmd("InsertCharPre", {
		group = augroup,
		callback = function()
			if vim.v.char == state.delimiter then
				vim.v.char = ""
				disable()
			elseif vim.v.char == " " then
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
