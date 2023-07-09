-- Main plugin spec

return {
	-- Fuzzy finder
	{ 'nvim-telescope/telescope.nvim',   tag = '0.1.2',      dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Tree-sitter - better highlighting
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	--{ 'folke/neodev.nvim', opts = {} },

	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		event = 'BufReadPre',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{                      -- Optional
				'williamboman/mason.nvim',
				build = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' }, -- Required
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = 'BufReadPre',
		config = function()
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
			local null_ls = require("null-ls")
			null_ls.setup({
				-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
				--null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.diagnostics.actionlint,
				null_ls.builtins.diagnostics.alex, -- pnpm i -g alex
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Indent guides, including on empty lines
	{ 'lukas-reineke/indent-blankline.nvim', event = 'BufRead' },

	-- Show possible keybindings for command being typed
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- Color scheme
	{ 'EdenEast/nightfox.nvim' },

	-- Git decorations
	{ 'lewis6991/gitsigns.nvim' },

	-- Notifications
	{ 'rcarriga/nvim-notify' },

	-- File icons (NOTE: needs patched font)
	{ 'nvim-tree/nvim-web-devicons' },

	-- Status line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			{ 'nvim-tree/nvim-web-devicons', opt = true },
			{ 'EdenEast/nightfox.nvim',      opt = true },
		},
	},

	-- Decorated scrollbar
	{ 'lewis6991/satellite.nvim' },

	-- :Cheatsheet command to search through commands/keymap
	{
		'sudormrfbin/cheatsheet.nvim',
		dependencies = {
			{ 'nvim-telescope/telescope.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		}
	},

	-- Automatically change corresponding HTML/XML tag
	{ 'AndrewRadev/tagalong.vim' },

	-- Tabs
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			--auto_hide = true,
			preset = 'powerline',
			gitsigns = {
				added = { enabled = true, icon = '+' },
				changed = { enabled = true, icon = '~' },
				deleted = { enabled = true, icon = '-' },
			},
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},

	-- Persistence
	{
		'folke/persistence.nvim',
		event = 'BufReadPre', -- this will only start session saving when an actual file was opened
		opts = {
			-- barbar integration
			options = { 'buffers', 'curdir', 'tabpages', 'winsize', '' },
			pre_save = function() vim.api.nvim_exec_autocmds('User', { pattern = 'SessionSavePre' }) end,
		},
	},

	-- Reopen files at last edit position
	{ 'vladdoster/remember.nvim', opts = {} },

	-- File explorer (netrw is buggy)
	{
		'stevearc/oil.nvim',
		opts = {
			delete_to_trash = true,
			trash_command = "trash", -- (macOS) brew install trash
			keymaps = {
				["<BS"] = "actions.parent",
			},
			view_options = {
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".") or name == "node_modules"
				end,
			},
			float = {
				border = "single",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Cargo.toml
	{
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require('crates').setup({
				null_ls = {
					enabled = true,
					name = "crates.nvim",
				},
			})
		end,
	},

	-- Dashboard
	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		dependencies = { { 'nvim-tree/nvim-web-devicons' } }
	}
}
