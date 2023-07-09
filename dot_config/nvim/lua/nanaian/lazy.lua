-- Package manager
-- https://github.com/folke/lazy.nvim#-installation

-- Bootstrap lazy if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin specs from `plugins` directory
require("lazy").setup("nanaian.plugins") -- https://github.com/folke/lazy.nvim#-structuring-your-plugins

