-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require("packer").startup(function(use)
	-- Load packer
	use("wbthomason/packer.nvim")

	-- LSP config
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			-- { "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Gruvbox theme
	use({ "ellisonleao/gruvbox.nvim" })
	require("gruvbox").setup({
		transparent_mode = true,
	})

	--- Tokyo Night theme
	use("folke/tokyonight.nvim")
	require("tokyonight").setup({
		style = "night",
		-- style = "storm",
		transparent = true,
		styles = {
			-- sidebars = "transparent",
			-- floats = "transparent",
		},
		sidebars = { "qf", "help", "terminal", "packer" },
	})

	-- Poimandres theme
	-- use({
	-- 	--   'olivercederborg/poimandres.nvim',
	-- 	"~/Documents/Personal/nvim/poimandres.nvim",
	-- 	-- "BigusBeckus/poimandres.nvim",
	-- 	config = function()
	-- 		require("poimandres").setup({
	-- 			-- leave this setup function empty for default config
	-- 			-- or refer to the configuration section
	-- 			-- for configuration options
	-- 			dark_variant = true,
	-- 			disable_italics = false,
	-- 		})
	-- 	end,
	-- })

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		-- requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "auto",
			-- theme = "poimandres",
			-- theme = "tokyonight",
			-- theme = "gruvbox",
		},
	})

	-- Heirline
	--  local statusline = {...}
	--  local winbar = {...}
	--  local tabline = {...}
	--  use {
	--    "rebelot/heirline.nvim",
	--    config = function()
	--      require('heirline').setup(statusline, winbar, tabline)
	--    end
	--  }

	-- nvim-dap (Debug Adapter Protocol) and mason-nvim-dap
	use({ "mfussenegger/nvim-dap", "jayp0521/mason-nvim-dap.nvim" })

	-- nvim-dap UI
	-- use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- null-ls (Formatter/linter)
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Harpoon
	use({
		"ThePrimeagen/harpoon",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- nvim-treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Telescope (Fuzzy finder)
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	require("telescope").setup({
		defaults = {
			file_ignore_patterns = {
				"node%_modules/.*",
				".git/.*",
				"^dist/.*",
				"^.next/.*",
				"^.nuxt/.*",
			},
		},
	})
	require("telescope").load_extension("fzf")

	-- Fugitive
	use({ "tpope/vim-fugitive" })

	-- Gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	})

	-- Comment toggle plugin
	use("terrortylor/nvim-comment")

	-- Markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	vim.g.mkdp_echo_preview_url = 1
	vim.g.mkdp_theme = "dark"

	-- Indent blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- Vim vinegar
	use("tpope/vim-vinegar")

	-- Cellular automaton (this just looks fun as hell)
	use("eandrju/cellular-automaton.nvim")

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
end)
