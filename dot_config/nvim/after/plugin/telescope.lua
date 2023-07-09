local builtin = require('telescope.builtin')

-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
local project_files = function()
	local opts = {}
	vim.fn.system('git rev-parse --is-inside-work-tree')
	if vim.v.shell_error == 0 then
		builtin.git_files(opts)
	else
		builtin.find_files(opts)
	end
end

vim.keymap.set('n', '<leader>.', project_files, { desc = "Find project file" })
vim.keymap.set('n', '<leader>F', builtin.live_grep, { desc = "Search project" })
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<C-p>', builtin.git_files, {}) -- fuzzyfind git

