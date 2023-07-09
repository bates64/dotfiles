local version = vim.version()
local cwd = vim.fn.getcwd()

local header = {
	"neovim v" .. version.major .. "." .. version.minor,
	cwd,
	""
}

local center = {
	{
		desc = "file explorer",
		keymap = "",
		key = ",",
		icon = "  ",
		action = "Oil",
	},
	{
		desc = "fuzzy find",
		keymap = "<leader> .",
		key = ".",
		icon = "  ",
		icon_hl = "Function",
		action = "Telescope find_files", -- TODO: do same thing as `<leader>.`
	},
	{
		desc = "recent files",
		keymap = "",
		key = "r",
		icon = "  ",
		action = "Telescope oldfiles",
	},
	{
		desc = "new file",
		keymap = "",
		key = "n",
		icon = "  ",
		action = "enew",
	},
	{
		desc = "load session",
		keymap = "",
		key = "l",
		icon = "  ",
		action = "lua require('persistence').load()",
	},
	{
		desc = "load recent session",
		keymap = "",
		key = "L",
		icon = "  ",
		action = "lua require('persistence').load({ last = true })",
	},
	{
		desc = "update plugins",
		keymap = "",
		key = "u",
		icon = "  ",
		action = "Lazy update | MasonUpdate",
	},
	--[[{
		desc = "Manage Extensions",
		keymap = "",
		key = "m",
		icon = "  ",
		action = "Mason",
	},--]]
	{
		desc = "config",
		keymap = "",
		key = "s",
		icon = "  ",
		action = "Telescope find_files cwd=~/.config/nvim",
	},
	{
		desc = "quit",
		keymap = "",
		key = "q",
		icon = "  ",
		action = "exit",
	},
}

-- Overrides for dashboard file type
vim.api.nvim_create_autocmd("Filetype", {
	pattern = "dashboard",
	group = vim.api.nvim_create_augroup("Dashboard_au", { clear = true }),
	callback = function()
		vim.cmd([[
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler
            nnoremap <buffer> <F2> :h news.txt<CR>
        ]])
	end,
})

require("dashboard").setup({
	theme = "doom",
	config = {
		disable_move = true,
		header = header,
		center = center,
		footer = function()
			return {
				"startup took " .. require "lazy".stats().startuptime .. " ms"
			}
		end,
	},
})
