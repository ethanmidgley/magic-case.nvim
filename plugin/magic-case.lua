if vim.g.loaded_magic_case then
	return
end
vim.g.loaded_magic_case = true

vim.api.nvim_create_user_command("MagicCase", function()
	local magic_case = require("magic-case")
	magic_case.start()
end, {})
