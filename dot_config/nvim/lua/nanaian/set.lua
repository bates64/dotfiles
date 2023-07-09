-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indents
-- note that ~/.editorconfigs sets most
vim.opt.smartindent = true

-- No wrap
vim.opt.wrap = false

-- Swapfile
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50

-- Long-running undos
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false -- Don't keep matches highlighted
vim.opt.incsearch = true -- Incremental

vim.opt.termguicolors = true

-- Never have less than 8 chars towards top/bottom except when at EOF
vim.opt.scrolloff = 8

-- Columns
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Leader key
vim.g.mapleader = " "

-- Show invisibles
--[[
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
--]]

-- Highlight line
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- Disable netrw (we use oil instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

