local lsp = require('lsp-zero')

lsp.preset("recommended")

-- Can also do :LspInstall on a file to install lsp for current buffer language
lsp.ensure_installed({
	"lua_ls",

	-- JS/TS
	"tsserver",
	"eslint",
	"jsonls",

	-- HTML
	"html",
	"emmet_ls",
	"tailwindcss",

	-- Rust
	"rust_analyzer",
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	-- Auto format
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({ async = false })
				--vim.lsp.buf.formatting_sync()
			end,
		})
	end
end)

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
			check = {
				command = "clippy",
			},
		},
	}
})

lsp.setup()

-- Autocompletion
local cmp = require('cmp')
cmp.setup({
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'buffer' },
		{ name = 'crates' },
	})
})
