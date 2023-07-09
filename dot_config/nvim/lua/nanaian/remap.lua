-- Hard mode
--[[
-- Disable arrow keys (prefer hjkl)
vim.api.nvim_set_keymap("n", "<Up>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<NOP>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<NOP>", { noremap = true })
--]]

-- File explorer (netrw) - disabled in favour of oil
--[[
vim.api.nvim_buf_set_keymap(0, 'n', 'l', ':lua require("netrw").netre_backhist(v:count1)<CR>', { silent = true, noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', 'l', ':lua require("netrw").netre_inhist(v:count1)<CR>', { silent = true, noremap = true })
--]]

-- Move selection with formatting
-- In VISUAL, J and K move selected lines up and down and auto-format
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Don't yank when pasting to replace
-- https://youtu.be/w7i4amO_zaE?t=1594
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste" })

-- Leader y yanks into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to clipboard" })
--vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Leader s replaces current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })

-- Leader x makes current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

