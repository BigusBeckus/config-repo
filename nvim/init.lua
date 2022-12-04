-- Settings
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = false
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false

require('beck.plugins')
require('beck.lsp')
require('beck.cmp')
require('beck.keys')
-- vim.cmd('colorscheme poimandres')
vim.cmd('colorscheme tokyonight')
-- Recompile packer managed plugins on write to plugins.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

