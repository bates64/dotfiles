local oil = require('oil')

vim.keymap.set("n", ",", oil.toggle_float, { desc = "File explorer" })

--[[ Automatically show preview window
-- https://github.com/stevearc/oil.nvim/issues/87
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	callback = vim.schedule_wrap(function(args)
		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
			-- Open preview
			oil.select({ preview = true, tab = false })
		end
	end),
})
--]]
