-- This file can be loaded by calling `lua require('plugins')` from your init.vim
return require('packer').startup(function(use)
  -- Load packer
  use 'wbthomason/packer.nvim'

  -- Load manson (package manager)
  use { 'williamboman/mason.nvim' }
  require('mason').setup()

  -- LSP config
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Luasnip completion source
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- nvim-cmp configuration
  local cmp = require 'cmp'
  cmp.setup {
    snippet = {
      expand = function(args)
        require 'luasnip'.lsp_expand(args.body)
      end
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      -- more sources
    }, {
      { name = 'buffer' },
    })
  }

  -- Poimandres theme
  use {
    --   'olivercederborg/poimandres.nvim',
    -- '~/Documents/Personal/nvim/poimandres.nvim',
    'BigusBeckus/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        disable_italics = false,
      }
    end
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  require('lualine').setup {
    options = {
      -- theme = 'poimandres',
      theme = 'tokyonight',
      icons_enabled = false,
    }
  }

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

  -- nvim-dap (Debug Adapter Protocol)
  use 'mfussenegger/nvim-dap'

  -- nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Telescope (Fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        current_line_blame = true,
      }
    end
  }

  --- Tokyo Night theme
  use 'folke/tokyonight.nvim'
  require('tokyonight').setup({
    style = "storm",
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    sidebars = { "qf", "help", "terminal", "packer" },
  })

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  vim.g.mkdp_echo_preview_url = 1
  vim.g.mkdp_theme = 'dark'

  -- Indent blankline
  use "lukas-reineke/indent-blankline.nvim"
  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
  }

end)
